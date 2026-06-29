class ZhihuCli < Formula
  desc "CLI for the Zhihu Open Platform API"
  homepage "https://github.com/dawnswwwww/zhihu-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.0/zhihu-x86_64-apple-darwin.tar.gz"
      sha256 "2a28074a0dd368ffb772d6a42bdccf63881d72b1e3a2b314eaa31427c76845f7"
    end
    on_arm do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.0/zhihu-aarch64-apple-darwin.tar.gz"
      sha256 "6b5b93c9341f0f0ec3100a2dc648b4062719e790167ce742d839cf58ffd39b76"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.0/zhihu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "754e6dfa21a1404a6c8c75b66387c6dce2c81ace887dbc7175e4d821b5807ec1"
    end
    on_arm do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.0/zhihu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "228dabd82c6b21148c6ca83e34cb54aad86cf7ab8ce4bad5f0cb0dba71d73cb7"
    end
  end

  def install
    bin.install "zhihu"
  end

  test do
    assert_match "Zhihu Open Platform CLI", shell_output("#{bin}/zhihu --help")
  end
end
