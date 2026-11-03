# frozen_string_literal: true

class Dross < Formula
  desc "Developer disk cleaner"
  homepage "https://github.com/getdross/dross"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/getdross/dross/releases/download/v0.1.10/dross-cli-aarch64-apple-darwin.tar.xz"
      sha256 "5267b6fcf67c81531cb6c803d33211c5449d8e2c30bd1427fb356adf9c9db3a8"
    end
    on_intel do
      url "https://github.com/getdross/dross/releases/download/v0.1.10/dross-cli-x86_64-apple-darwin.tar.xz"
      sha256 "8165849b29035dbdb456c3588220cd67741942ea47308e4352939e9c19bdfbf1"
    end
  end

  def install
    bin.install "dross"
  end

  test do
    assert_match "dross 0.1.10", shell_output("#{bin}/dross --version")
  end
end
