# Homebrew formula template for Legion.
#
# The release workflow renders this into Formula/legion.rb in the
# dawnswwwww/homebrew-tap tap, substituting 0.0.1-rc.3, 45e51f5b5c9a595192643b5268054b4bee01a5e1d7e5769ec606bff11d0af7a7,
# and ba41abcbb1d1ccf9ec0e665c6c2fcb086c796c8494f96ca11e70d1b950032fde.
#
# Users install via:  brew install dawnswwwww/tap/legion
class Legion < Formula
  desc "Self-hosted, multi-channel AI agent gateway and CLI"
  homepage "https://github.com/dawnswwwww/uselegion"
  url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.3/legion-0.0.1-rc.3-x86_64-apple-darwin.tar.gz"
  sha256 "ba41abcbb1d1ccf9ec0e665c6c2fcb086c796c8494f96ca11e70d1b950032fde"
  license "MIT"
  version "0.0.1-rc.3"

  # Both legion (CLI) and legion-gateway (sidecar) ship in the same archive.
  # On Intel macOS, the x86_64 archive is fetched; arm64 uses on_resource.
  on_macos do
    on_arm do
      url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.3/legion-0.0.1-rc.3-aarch64-apple-darwin.tar.gz"
      sha256 "45e51f5b5c9a595192643b5268054b4bee01a5e1d7e5769ec606bff11d0af7a7"
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
