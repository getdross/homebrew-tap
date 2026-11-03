# frozen_string_literal: true

class Dross < Formula
  desc "Developer disk cleaner"
  homepage "https://github.com/getdross/dross"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/getdross/dross/releases/download/v0.1.9/dross-cli-aarch64-apple-darwin.tar.xz"
      sha256 "dceeced234ba7ca618cfefb22258e90d514dc083475502aae20c89085c71e5f2"
    end
    on_intel do
      url "https://github.com/getdross/dross/releases/download/v0.1.9/dross-cli-x86_64-apple-darwin.tar.xz"
      sha256 "237e7669793f3aa16ff89473d4efb26a3ed6544ca6ebd63461e3ce3cb0888a4f"
    end
  end

  def install
    bin.install "dross"
  end

  test do
    assert_match "dross 0.1.9", shell_output("#{bin}/dross --version")
  end
end
