# Homebrew formula template for Legion.
#
# The release workflow renders this into Formula/legion.rb in the
# dawnswwwww/homebrew-tap tap, substituting 0.0.1-rc.2, 25d3d3961bcd2619f74913d409a3e9aa71ea506c9e996d5578fbb12b9da36a99,
# and a5dd1bcf216f92b85160335edd5e5d36959c66a8ecbb07c2d4ff1ddf5eb06ae4.
#
# Users install via:  brew install dawnswwwww/tap/legion
class Legion < Formula
  desc "Self-hosted, multi-channel AI agent gateway and CLI"
  homepage "https://github.com/dawnswwwww/uselegion"
  url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.2/legion-0.0.1-rc.2-x86_64-apple-darwin.tar.gz"
  sha256 "a5dd1bcf216f92b85160335edd5e5d36959c66a8ecbb07c2d4ff1ddf5eb06ae4"
  license "MIT"
  version "0.0.1-rc.2"

  # Both legion (CLI) and legion-gateway (sidecar) ship in the same archive.
  # On Intel macOS, the x86_64 archive is fetched; arm64 uses on_resource.
  on_macos do
    on_arm do
      url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.2/legion-0.0.1-rc.2-aarch64-apple-darwin.tar.gz"
      sha256 "25d3d3961bcd2619f74913d409a3e9aa71ea506c9e996d5578fbb12b9da36a99"
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
