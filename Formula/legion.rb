# Homebrew formula template for Legion.
#
# The release workflow renders this into Formula/legion.rb in the
# dawnswwwww/homebrew-tap tap, substituting 0.0.1-rc.1, 1c7a7483db3bc54273ed32c2ae872b4998a26634ba6ccfeaf412d14ada7220d1,
# and a8f85cc1d66fa09aa7c9552b7d296b1dc41a55cbed29e21c47a894018fe05ca6.
#
# Users install via:  brew install dawnswwwww/tap/legion
class Legion < Formula
  desc "Self-hosted, multi-channel AI agent gateway and CLI"
  homepage "https://github.com/dawnswwwww/uselegion"
  url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.1/legion-0.0.1-rc.1-x86_64-apple-darwin.tar.gz"
  sha256 "a8f85cc1d66fa09aa7c9552b7d296b1dc41a55cbed29e21c47a894018fe05ca6"
  license "MIT"
  version "0.0.1-rc.1"

  # Both legion (CLI) and legion-gateway (sidecar) ship in the same archive.
  # On Intel macOS, the x86_64 archive is fetched; arm64 uses on_resource.
  on_macos do
    on_arm do
      url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.1/legion-0.0.1-rc.1-aarch64-apple-darwin.tar.gz"
      sha256 "1c7a7483db3bc54273ed32c2ae872b4998a26634ba6ccfeaf412d14ada7220d1"
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
