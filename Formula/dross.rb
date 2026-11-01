# frozen_string_literal: true

class Dross < Formula
  desc "Developer disk cleaner"
  homepage "https://github.com/getdross/dross"
  version "0.1.0"
  url "https://github.com/getdross/dross/releases/download/v0.1.0/dross-cli-aarch64-apple-darwin.tar.xz"
  sha256 "a9846adf2508ac953e32700f186b836e1724d3d32bdcd58d96e5639f2c3e17d2"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "dross"
  end

  test do
    assert_match "dross 0.1.0", shell_output("#{bin}/dross --version")
  end
end
