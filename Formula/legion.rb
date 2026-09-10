# Homebrew formula template for Legion.
#
# The release workflow renders this into Formula/legion.rb in the
# dawnswwwww/homebrew-tap tap, substituting 0.0.1-rc.6, 8de0e1a6aa6608b2165a522e504131a5010437fd6f847fd15ad3b89cb117a3c7,
# and f791387c0de508aaafc3671c5982dec0441f4467e0c6b3237baebdfcc2c45f49.
#
# Users install via:  brew install dawnswwwww/tap/legion
class Legion < Formula
  desc "Self-hosted, multi-channel AI agent gateway and CLI"
  homepage "https://github.com/dawnswwwww/uselegion"
  url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.6/legion-0.0.1-rc.6-x86_64-apple-darwin.tar.gz"
  sha256 "f791387c0de508aaafc3671c5982dec0441f4467e0c6b3237baebdfcc2c45f49"
  license "MIT"
  version "0.0.1-rc.6"

  # Both legion (CLI) and legion-gateway (sidecar) ship in the same archive.
  # On Intel macOS, the x86_64 archive is fetched; arm64 uses on_resource.
  on_macos do
    on_arm do
      url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.6/legion-0.0.1-rc.6-aarch64-apple-darwin.tar.gz"
      sha256 "8de0e1a6aa6608b2165a522e504131a5010437fd6f847fd15ad3b89cb117a3c7"
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
