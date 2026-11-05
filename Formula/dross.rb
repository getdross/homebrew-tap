# frozen_string_literal: true

class Dross < Formula
  desc "Developer disk cleaner"
  homepage "https://github.com/getdross/dross"
  version "0.2.3"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/getdross/dross/releases/download/v0.2.3/dross-cli-aarch64-apple-darwin.tar.xz"
      sha256 "7666103068f082c1cec091d6a89d424a6d6d3f7770291513aa7a5d10f9e54adb"
    end
    on_intel do
      url "https://github.com/getdross/dross/releases/download/v0.2.3/dross-cli-x86_64-apple-darwin.tar.xz"
      sha256 "b5b9a9b8ad999784e50c3f9f20e977a53425cdfcf775878c4c39889048e12828"
    end
  end

  def install
    bin.install "dross"
  end

  test do
    assert_match "dross 0.2.3", shell_output("#{bin}/dross --version")
  end
end
