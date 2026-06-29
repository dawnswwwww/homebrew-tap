class ZhihuCli < Formula
  desc "CLI for the Zhihu Open Platform API"
  homepage "https://github.com/dawnswwwww/zhihu-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.1/zhihu-x86_64-apple-darwin.tar.gz"
      sha256 "2c0f1f24cc332c13b9d0731f1258cd8c9652cbbc2dc521a47db0f945f1944f4e"
    end
    on_arm do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.1/zhihu-aarch64-apple-darwin.tar.gz"
      sha256 "9761e3f0842760e9d5fa98883f7b0eb1a49bc3ffe59908eca64d2a96f7ee8306"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.1/zhihu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8d19f9fbfbe6cdbf005a1327d2008d73910efdb4072e2b8a22db339025fcfa1"
    end
    on_arm do
      url "https://github.com/dawnswwwww/zhihu-cli/releases/download/v0.1.1/zhihu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2d1796d295a6ab1090b581a12e95a8c352cf9f5f67740de2a6c5931163616aa0"
    end
  end

  def install
    bin.install "zhihu"
  end

  test do
    assert_match "Zhihu Open Platform CLI", shell_output("#{bin}/zhihu --help")
  end
end
