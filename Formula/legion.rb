# Homebrew formula template for Legion.
#
# The release workflow renders this into Formula/legion.rb in the
# dawnswwwww/homebrew-tap tap, substituting 0.0.1-rc.1, 1d63adf7d267c1f47ee828ba3637ac6efa6c64f27793143cfdbc26447ec17780,
# and 083ddcf16077f7247239c8bd770a522868d0f91db0ac1c50a71836a9447365bb.
#
# Users install via:  brew install dawnswwwww/tap/legion
class Legion < Formula
  desc "Self-hosted, multi-channel AI agent gateway and CLI"
  homepage "https://github.com/dawnswwwww/uselegion"
  url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.1/legion-0.0.1-rc.1-x86_64-apple-darwin.tar.gz"
  sha256 "083ddcf16077f7247239c8bd770a522868d0f91db0ac1c50a71836a9447365bb"
  license "MIT"
  version "0.0.1-rc.1"

  # Both legion (CLI) and legion-gateway (sidecar) ship in the same archive.
  # On Intel macOS, the x86_64 archive is fetched; arm64 uses on_resource.
  on_macos do
    on_arm do
      url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.1/legion-0.0.1-rc.1-aarch64-apple-darwin.tar.gz"
      sha256 "1d63adf7d267c1f47ee828ba3637ac6efa6c64f27793143cfdbc26447ec17780"
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
