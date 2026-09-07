class ZhihuCli < Formula
  desc "CLI for the Zhihu Open Platform API"
  homepage "https://github.com/dawnswwwww/zhihu-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.2.0/zhihu-x86_64-apple-darwin.tar.gz"
      sha256 "31e1ab3d29acebef59c2e3ada81d69dec4bf04b75fd9b1c7222e0dfea0b972fc"
    end
    on_arm do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.2.0/zhihu-aarch64-apple-darwin.tar.gz"
      sha256 "e93b19d45bb24b52726a66b5feafd16bb2f4ffe1162ab100ca6a6be612da379e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.2.0/zhihu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a17cb42ef13df0c34db52066e9a258aa2d60ad3c70e6948090c7599fdef0e1e"
    end
    on_arm do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.2.0/zhihu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d967aa18d02d8267ef7ac23436ef1b6e648f62b50fb40bee6a12843259616c8c"
    end
  end

  def install
    bin.install "zhihu"
  end

  test do
    assert_match "Zhihu Open Platform CLI", shell_output("#{bin}/zhihu --help")
  end
end
