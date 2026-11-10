# frozen_string_literal: true

class Dross < Formula
  desc "Developer disk cleaner"
  homepage "https://github.com/getdross/dross"
  version "0.3.1"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/getdross/dross/releases/download/v0.3.1/dross-cli-aarch64-apple-darwin.tar.xz"
      sha256 "69ca1acfe4b92be87a877fe165cb3dd08ed6f65fb16e53cdfe290693bc72c3dd"
    end
    on_intel do
      url "https://github.com/getdross/dross/releases/download/v0.3.1/dross-cli-x86_64-apple-darwin.tar.xz"
      sha256 "470b0aca9418e4ec202dbf0da9646f46f025219c6c5bb60bde73b791cc807e29"
    end
  end

  def install
    bin.install "dross"
  end

  test do
    assert_match "dross 0.3.1", shell_output("#{bin}/dross --version")
  end
end
