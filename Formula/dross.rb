# frozen_string_literal: true

class Dross < Formula
  desc "Developer disk cleaner"
  homepage "https://github.com/getdross/dross"
  version "0.3.0"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/getdross/dross/releases/download/v0.3.0/dross-cli-aarch64-apple-darwin.tar.xz"
      sha256 "cd60ec3f334c9c3f3adc03c9cbd3af5c5c9355b8af093c79e5705a43a8aa701c"
    end
    on_intel do
      url "https://github.com/getdross/dross/releases/download/v0.3.0/dross-cli-x86_64-apple-darwin.tar.xz"
      sha256 "4f828b7c3a295c78081ba3b69b997fa499c3389a7fea2d973b686ca6248a58e6"
    end
  end

  def install
    bin.install "dross"
  end

  test do
    assert_match "dross 0.3.0", shell_output("#{bin}/dross --version")
  end
end
