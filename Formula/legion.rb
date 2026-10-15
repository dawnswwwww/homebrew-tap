# Homebrew formula template for Legion.
#
# The release workflow renders this into Formula/legion.rb in the
# dawnswwwww/homebrew-tap tap, substituting 0.0.1-rc.8, 03956308c13a94907b2b52623b3b47ee10396587e2b2443f862358b2a48d0b7c,
# and 7b1ed41469e76c1388623f9f2deb3309e8c9125d2a7100d1377137dd59fe0edc.
#
# Users install via:  brew install dawnswwwww/tap/legion
class Legion < Formula
  desc "Self-hosted, multi-channel AI agent gateway and CLI"
  homepage "https://github.com/dawnswwwww/uselegion"
  url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.8/legion-0.0.1-rc.8-x86_64-apple-darwin.tar.gz"
  sha256 "7b1ed41469e76c1388623f9f2deb3309e8c9125d2a7100d1377137dd59fe0edc"
  license "MIT"
  version "0.0.1-rc.8"

  # Both legion (CLI) and legion-gateway (sidecar) ship in the same archive.
  # On Intel macOS, the x86_64 archive is fetched; arm64 uses on_resource.
  on_macos do
    on_arm do
      url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.8/legion-0.0.1-rc.8-aarch64-apple-darwin.tar.gz"
      sha256 "03956308c13a94907b2b52623b3b47ee10396587e2b2443f862358b2a48d0b7c"
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
