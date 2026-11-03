# frozen_string_literal: true

class Dross < Formula
  desc "Developer disk cleaner"
  homepage "https://github.com/getdross/dross"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/getdross/dross/releases/download/v0.2.1/dross-cli-aarch64-apple-darwin.tar.xz"
      sha256 "d51c8ccada792ff6a91c3b4c4532c2c4ec39bc3aef4105d7da224d143b542c39"
    end
    on_intel do
      url "https://github.com/getdross/dross/releases/download/v0.2.1/dross-cli-x86_64-apple-darwin.tar.xz"
      sha256 "b5ba7d735fbdfcb6b46a38aedfbba5818c26662b048aeb8672ba63ad0ab3af6c"
    end
  end

  def install
    bin.install "dross"
  end

  test do
    assert_match "dross 0.2.1", shell_output("#{bin}/dross --version")
  end
end
