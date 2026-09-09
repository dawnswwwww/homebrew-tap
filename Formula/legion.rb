# Homebrew formula template for Legion.
#
# The release workflow renders this into Formula/legion.rb in the
# dawnswwwww/homebrew-tap tap, substituting 0.0.1-rc.5, 9ecb0183103a8d23808fc5f4874b40623cfb25d0b46d3922a87b4bbd02a58a62,
# and dead208a4059aebfad3838b40f5ae86543f7f253575be7c85c8527d240885d18.
#
# Users install via:  brew install dawnswwwww/tap/legion
class Legion < Formula
  desc "Self-hosted, multi-channel AI agent gateway and CLI"
  homepage "https://github.com/dawnswwwww/uselegion"
  url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.5/legion-0.0.1-rc.5-x86_64-apple-darwin.tar.gz"
  sha256 "dead208a4059aebfad3838b40f5ae86543f7f253575be7c85c8527d240885d18"
  license "MIT"
  version "0.0.1-rc.5"

  # Both legion (CLI) and legion-gateway (sidecar) ship in the same archive.
  # On Intel macOS, the x86_64 archive is fetched; arm64 uses on_resource.
  on_macos do
    on_arm do
      url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.5/legion-0.0.1-rc.5-aarch64-apple-darwin.tar.gz"
      sha256 "9ecb0183103a8d23808fc5f4874b40623cfb25d0b46d3922a87b4bbd02a58a62"
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
