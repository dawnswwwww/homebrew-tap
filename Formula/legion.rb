# Homebrew formula template for Legion.
#
# The release workflow renders this into Formula/legion.rb in the
# dawnswwwww/homebrew-tap tap, substituting 0.0.1-rc.1, d9fea348557ceddcc4bf51503bcb8e657778509edd8f2c73851e035ef2784179,
# and 01e5a4fd0be357cf26d0f355474f2e88df79f85c7ada4a1de0264cffcf4c4bca.
#
# Users install via:  brew install dawnswwwww/tap/legion
class Legion < Formula
  desc "Self-hosted, multi-channel AI agent gateway and CLI"
  homepage "https://github.com/dawnswwwww/uselegion"
  url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.1/legion-0.0.1-rc.1-x86_64-apple-darwin.tar.gz"
  sha256 "01e5a4fd0be357cf26d0f355474f2e88df79f85c7ada4a1de0264cffcf4c4bca"
  license "MIT"
  version "0.0.1-rc.1"

  # Both legion (CLI) and legion-gateway (sidecar) ship in the same archive.
  # On Intel macOS, the x86_64 archive is fetched; arm64 uses on_resource.
  on_macos do
    on_arm do
      url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.1/legion-0.0.1-rc.1-aarch64-apple-darwin.tar.gz"
      sha256 "d9fea348557ceddcc4bf51503bcb8e657778509edd8f2c73851e035ef2784179"
    end
  end

  def install
    bin.install "legion"
    bin.install "legion-gateway"
  end

  def caveats
    <<~EOS
      Run `legion setup` to configure your provider and channels for the first
      time. The gateway can be started with `legion gateway start`.
    EOS
  end

  test do
    assert_match "legion #{version}", shell_output("#{bin}/legion --version")
  end
end
