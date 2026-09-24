class ZhihuCli < Formula
  desc "CLI for the Zhihu Open Platform API"
  homepage "https://github.com/dawnswwwww/zhihu-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.3.0/zhihu-x86_64-apple-darwin.tar.gz"
      sha256 "8b986c99c6496ec74ccde356f686fba8223f59da4e56f0a94a8cf34291b3a603"
    end
    on_arm do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.3.0/zhihu-aarch64-apple-darwin.tar.gz"
      sha256 "5656debd0c5a8392e6382f03956787e350e0d7d67f3325704a34c67cf530aabf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.3.0/zhihu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3c0e26ed794e612221cf42fa36f5ef3af8a1b2153ad2a764b40491ccf4b82062"
    end
    on_arm do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.3.0/zhihu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9052c27c62e6350edb5c06dad040e1ea0712a469b3c5e889f9512e4cb2f70385"
    end
  end

  def install
    bin.install "zhihu"
  end

  test do
    assert_match "Zhihu Open Platform CLI", shell_output("#{bin}/zhihu --help")
  end
end
