# Homebrew formula template for Legion.
#
# The release workflow renders this into Formula/legion.rb in the
# dawnswwwww/homebrew-tap tap, substituting 0.0.1-rc.5, 056a54627d1226c267d0e1670ebb3ee3c917b2a1a2c5a47ba8faead2be402cb5,
# and 30c49c3e7e09e0071ef94229ada50bc465a888c4a41336d58e72e76358736c0d.
#
# Users install via:  brew install dawnswwwww/tap/legion
class Legion < Formula
  desc "Self-hosted, multi-channel AI agent gateway and CLI"
  homepage "https://github.com/dawnswwwww/uselegion"
  url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.5/legion-0.0.1-rc.5-x86_64-apple-darwin.tar.gz"
  sha256 "30c49c3e7e09e0071ef94229ada50bc465a888c4a41336d58e72e76358736c0d"
  license "MIT"
  version "0.0.1-rc.5"

  # Both legion (CLI) and legion-gateway (sidecar) ship in the same archive.
  # On Intel macOS, the x86_64 archive is fetched; arm64 uses on_resource.
  on_macos do
    on_arm do
      url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.5/legion-0.0.1-rc.5-aarch64-apple-darwin.tar.gz"
      sha256 "056a54627d1226c267d0e1670ebb3ee3c917b2a1a2c5a47ba8faead2be402cb5"
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
