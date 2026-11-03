# frozen_string_literal: true

class Dross < Formula
  desc "Developer disk cleaner"
  homepage "https://github.com/getdross/dross"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/getdross/dross/releases/download/v0.2.0/dross-cli-aarch64-apple-darwin.tar.xz"
      sha256 "4d7f39e462463e0bda634b35a980aeeba4f71a6549a4f16fab968283a1c1300f"
    end
    on_intel do
      url "https://github.com/getdross/dross/releases/download/v0.2.0/dross-cli-x86_64-apple-darwin.tar.xz"
      sha256 "945414ababda811792e142ea6897dc79f4ac6b38dbc90b472c96aac91d464182"
    end
  end

  def install
    bin.install "dross"
  end

  test do
    assert_match "dross 0.2.0", shell_output("#{bin}/dross --version")
  end
end
