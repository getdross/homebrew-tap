# frozen_string_literal: true

class Dross < Formula
  desc "Developer disk cleaner"
  homepage "https://github.com/getdross/dross"
  version "0.2.2"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/getdross/dross/releases/download/v0.2.2/dross-cli-aarch64-apple-darwin.tar.xz"
      sha256 "549c42c14e27671408fd6343029f81b2849b3414c50271142fa9dadce19f029b"
    end
    on_intel do
      url "https://github.com/getdross/dross/releases/download/v0.2.2/dross-cli-x86_64-apple-darwin.tar.xz"
      sha256 "5361a9b07211dce28e4ff3328885aa2b0e6350711dd136595bb0dd2b84b84900"
    end
  end

  def install
    bin.install "dross"
  end

  test do
    assert_match "dross 0.2.2", shell_output("#{bin}/dross --version")
  end
end
