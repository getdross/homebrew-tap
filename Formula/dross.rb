# frozen_string_literal: true

class Dross < Formula
  desc "Yosr Dross: developer disk cleaner for macOS"
  homepage "https://dross.yosr.ai"
  license :cannot_represent
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/getdross/dross/releases/download/v0.4.0/dross-cli-aarch64-apple-darwin.tar.xz"
      sha256 "4aad26cd59eb7332f2ea6507cb504fdb4e8d91f64b3a74e7d6fc791b903e94ae"
    end
    on_intel do
      url "https://github.com/getdross/dross/releases/download/v0.4.0/dross-cli-x86_64-apple-darwin.tar.xz"
      sha256 "9c92c252d1ac489a18ed80d48446c3f157e8b76abc93b46865dc6fe10633c421"
    end
  end

  def install
    bin.install "dross"
  end

  test do
    assert_match "dross 0.4.0", shell_output("#{bin}/dross --version")
  end
end
