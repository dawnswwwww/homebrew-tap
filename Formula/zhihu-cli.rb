class ZhihuCli < Formula
  desc "CLI for the Zhihu Open Platform API"
  homepage "https://github.com/dawnswwwww/zhihu-cli"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.2/zhihu-x86_64-apple-darwin.tar.gz"
      sha256 "6c417a80ee522d2c2ceb25d093852272c552a9a8361405c38af09cdcede2a8f8"
    end
    on_arm do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.2/zhihu-aarch64-apple-darwin.tar.gz"
      sha256 "f2acf308e10b9baa101b826469b4488d868b67420e8426fc44cb14048b399d09"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.2/zhihu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "425a79f9d7377c049bfec280edceddadc0ed5fb7300e838154a9b278b06ab262"
    end
    on_arm do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.2/zhihu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d3ee49f36751038c4ce05c888bc11181d180804048bd003a3b8b35c4d1f5441b"
    end
  end

  def install
    bin.install "zhihu"
  end

  test do
    assert_match "Zhihu Open Platform CLI", shell_output("#{bin}/zhihu --help")
  end
end
