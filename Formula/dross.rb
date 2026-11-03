# frozen_string_literal: true

class Dross < Formula
  desc "Developer disk cleaner"
  homepage "https://github.com/getdross/dross"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/getdross/dross/releases/download/v0.1.11/dross-cli-aarch64-apple-darwin.tar.xz"
      sha256 "f897816ba0007fc6fb004bf2b9177b063e55373c4564813887a73c1b8e53f680"
    end
    on_intel do
      url "https://github.com/getdross/dross/releases/download/v0.1.11/dross-cli-x86_64-apple-darwin.tar.xz"
      sha256 "253fc2f7c191e6840e74f7a6a75da118be43e8016f0057fae4c182fda2bdb089"
    end
  end

  def install
    bin.install "dross"
  end

  test do
    assert_match "dross 0.1.11", shell_output("#{bin}/dross --version")
  end
end
