class ZhihuCli < Formula
  desc "CLI for the Zhihu Open Platform API"
  homepage "https://github.com/dawnswwwww/zhihu-cli"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.4/zhihu-x86_64-apple-darwin.tar.gz"
      sha256 "b30afca4af29a23b84cc212f50c103109035541bb325b212ff687182dc02933f"
    end
    on_arm do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.4/zhihu-aarch64-apple-darwin.tar.gz"
      sha256 "d7493563adf4cf93242faa4c1767d3f18611e1e75477a822d94e20c3cb83da0d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.4/zhihu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f870912704f99f85990c37d2602fc545b5b6f36b86842b5167233e069d0cf40"
    end
    on_arm do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.4/zhihu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "daaec9b9565f0466f950fcc1c2b08b0b26b42cb5cefe9ec8c07e226cb710239a"
    end
  end

  def install
    bin.install "zhihu"
  end

  test do
    assert_match "Zhihu Open Platform CLI", shell_output("#{bin}/zhihu --help")
  end
end
