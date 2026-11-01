# frozen_string_literal: true

# Downloads one asset from a private GitHub Release.
# `HOMEBREW_GITHUB_API_TOKEN` must be able to read that repository.
# Homebrew does not pass the `gh` login into a custom download strategy.
class PrivateGitHubReleaseDownloadStrategy < CurlDownloadStrategy
  def fetch(timeout: nil)
    token = ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")
    if token.empty?
      raise CurlDownloadStrategyError.new(
        url,
        "Set HOMEBREW_GITHUB_API_TOKEN to a token that can read the private release.",
      )
    end

    ohai "Downloading #{url}"
    if cached_location.exist?
      puts "Already downloaded: #{cached_location}"
    else
      begin
        Utils::Curl.curl_download(
          asset_api_url(token),
          "--header", "Accept: application/octet-stream",
          "--header", "Authorization: Bearer #{token}",
          to: temporary_path,
          secrets: [token],
          timeout:,
        )
      rescue ErrorDuringExecution
        raise CurlDownloadStrategyError, url
      end
      cached_location.dirname.mkpath
      temporary_path.rename(cached_location.to_s)
    end

    symlink_location.dirname.mkpath
    FileUtils.ln_s cached_location.relative_path_from(symlink_location.dirname), symlink_location, force: true
  end

  private

  def asset_api_url(token)
    match = url.match(%r{\Ahttps://github\.com/([^/]+)/([^/]+)/releases/download/([^/]+)/([^/?#]+)\z})
    raise CurlDownloadStrategyError.new(url, "Not a GitHub release asset URL.") if match.nil?

    owner, repo, tag, filename = match.captures
    meta = Utils::Curl.curl_output(
      "https://api.github.com/repos/#{owner}/#{repo}/releases/tags/#{tag}",
      "--header", "Accept: application/vnd.github+json",
      "--header", "Authorization: Bearer #{token}",
      secrets: [token],
    )
    release = JSON.parse(meta.stdout)
    asset = release.fetch("assets").find { |item| item["name"] == filename }
    raise CurlDownloadStrategyError.new(url, "Release asset #{filename} was not found.") if asset.nil?

    asset.fetch("url")
  end
end

class Dross < Formula
  desc "Developer disk cleaner"
  homepage "https://github.com/wzohny/dross"
  version "0.1.0"
  url "https://github.com/wzohny/dross/releases/download/v0.1.0/dross-cli-aarch64-apple-darwin.tar.xz",
      using: PrivateGitHubReleaseDownloadStrategy
  sha256 "7762cd8f7cebb4e82c40631b5c548dd08e26a26ca39881372ec6a22a06cbbcfb"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "dross"
  end

  test do
    assert_match "dross 0.1.0", shell_output("#{bin}/dross --version")
  end
end
