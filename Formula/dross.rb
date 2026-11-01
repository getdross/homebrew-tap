# frozen_string_literal: true

class Dross < Formula
  desc "Developer disk cleaner"
  homepage "https://github.com/getdross/dross"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/getdross/dross/releases/download/v0.1.0/dross-cli-aarch64-apple-darwin.tar.xz"
      sha256 "a9846adf2508ac953e32700f186b836e1724d3d32bdcd58d96e5639f2c3e17d2"
    end
    on_intel do
      url "https://github.com/getdross/dross/releases/download/v0.1.0/dross-cli-x86_64-apple-darwin.tar.xz"
      sha256 "c10bdd892f671c3cfdcdd4d5c08f2ce7ce6172f36477b06a2c3f6bea6d24ee83"
    end
  end

  def install
    bin.install "dross"
  end

  test do
    assert_match "dross 0.1.0", shell_output("#{bin}/dross --version")
  end
end
