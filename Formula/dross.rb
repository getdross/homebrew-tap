# frozen_string_literal: true

class Dross < Formula
  desc "Yosr Dross: developer disk cleaner for macOS"
  homepage "https://dross.yosr.ai"
  license :cannot_represent
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/getdross/dross/releases/download/v0.4.1/dross-cli-aarch64-apple-darwin.tar.xz"
      sha256 "f60ffc2e7ecebac26a9f8bd772c517dbe3589d74daadff136f0c6510fb282d59"
    end
    on_intel do
      url "https://github.com/getdross/dross/releases/download/v0.4.1/dross-cli-x86_64-apple-darwin.tar.xz"
      sha256 "9ab814ec28922e286c5ef4bc366afc228681a3e493917977c43a614d64ea2180"
    end
  end

  def install
    bin.install "dross"
  end

  test do
    assert_match "dross 0.4.1", shell_output("#{bin}/dross --version")
  end
end
