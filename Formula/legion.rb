# Homebrew formula template for Legion.
#
# The release workflow renders this into Formula/legion.rb in the
# dawnswwwww/homebrew-tap tap, substituting 0.0.1-rc.4, b998efd3deb8e0835a647e6237e973b72dd72ff12945ace1f2f432fb337116ca,
# and 6962c33635018ffd216e8db96c4a9749bc60d7c5c4aba1869087277d46276e4d.
#
# Users install via:  brew install dawnswwwww/tap/legion
class Legion < Formula
  desc "Self-hosted, multi-channel AI agent gateway and CLI"
  homepage "https://github.com/dawnswwwww/uselegion"
  url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.4/legion-0.0.1-rc.4-x86_64-apple-darwin.tar.gz"
  sha256 "6962c33635018ffd216e8db96c4a9749bc60d7c5c4aba1869087277d46276e4d"
  license "MIT"
  version "0.0.1-rc.4"

  # Both legion (CLI) and legion-gateway (sidecar) ship in the same archive.
  # On Intel macOS, the x86_64 archive is fetched; arm64 uses on_resource.
  on_macos do
    on_arm do
      url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.4/legion-0.0.1-rc.4-aarch64-apple-darwin.tar.gz"
      sha256 "b998efd3deb8e0835a647e6237e973b72dd72ff12945ace1f2f432fb337116ca"
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
