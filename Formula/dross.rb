# frozen_string_literal: true

class Dross < Formula
  desc "Developer disk cleaner"
  homepage "https://github.com/getdross/dross"
  version "0.3.2"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/getdross/dross/releases/download/v0.3.2/dross-cli-aarch64-apple-darwin.tar.xz"
      sha256 "6e03304b98450d8d52ebcf3fced36f9650c9b4e8d92a79e864e1f2b233e6313f"
    end
    on_intel do
      url "https://github.com/getdross/dross/releases/download/v0.3.2/dross-cli-x86_64-apple-darwin.tar.xz"
      sha256 "d39f4ca71a628d34ea4ec1017deff70b336907afcd772bf5708146e6f8837f89"
    end
  end

  def install
    bin.install "dross"
  end

  test do
    assert_match "dross 0.3.2", shell_output("#{bin}/dross --version")
  end
end
