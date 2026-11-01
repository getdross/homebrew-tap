# frozen_string_literal: true

class Dross < Formula
  desc "Developer disk cleaner"
  homepage "https://github.com/getdross/dross"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/getdross/dross/releases/download/v0.1.2/dross-cli-aarch64-apple-darwin.tar.xz"
      sha256 "b04ff54099589772e399ab4edccae210b876bb04b752bdc4334af2730d8545c8"
    end
    on_intel do
      url "https://github.com/getdross/dross/releases/download/v0.1.2/dross-cli-x86_64-apple-darwin.tar.xz"
      sha256 "a12860e4592f263b0de11a347a9e60ce8ba056f6837693494d0f40bd7323c49b"
    end
  end

  def install
    bin.install "dross"
  end

  test do
    assert_match "dross 0.1.2", shell_output("#{bin}/dross --version")
  end
end
