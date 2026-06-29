class ZhihuCli < Formula
  desc "CLI for the Zhihu Open Platform API"
  homepage "https://github.com/dawnswwwww/zhihu-cli"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.3/zhihu-x86_64-apple-darwin.tar.gz"
      sha256 "7a8a4eb46d8ded57312e81b2428d3f483cbf9b20ee1cb1b8634f23162ca3a9fd"
    end
    on_arm do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.3/zhihu-aarch64-apple-darwin.tar.gz"
      sha256 "cea8d6aedf9de9daca26b72ac74c3c7dd33d68d5e14c42c5e7f732185c914b50"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.3/zhihu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f11799e4db1f07d848984cfab5fed2caf029ce1e0f34a94d57c384ddc89d7a6"
    end
    on_arm do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.3/zhihu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "adc07200eeaff1205070f02a5327feb8ff352bc64d4dd769ebbae957c7f45280"
    end
  end

  def install
    bin.install "zhihu"
  end

  test do
    assert_match "Zhihu Open Platform CLI", shell_output("#{bin}/zhihu --help")
  end
end
