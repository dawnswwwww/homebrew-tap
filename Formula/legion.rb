# Homebrew formula template for Legion.
#
# The release workflow renders this into Formula/legion.rb in the
# dawnswwwww/homebrew-tap tap, substituting 0.0.1-rc.7, 83f1a16479466cd4f68af067701c61469d41765516158b3845ec760d2389b7a5,
# and 996e557f1d8484473bdeb4c526fd60c9d5cffffa8253ed7e4deb5d664588d6c9.
#
# Users install via:  brew install dawnswwwww/tap/legion
class Legion < Formula
  desc "Self-hosted, multi-channel AI agent gateway and CLI"
  homepage "https://github.com/dawnswwwww/uselegion"
  url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.7/legion-0.0.1-rc.7-x86_64-apple-darwin.tar.gz"
  sha256 "996e557f1d8484473bdeb4c526fd60c9d5cffffa8253ed7e4deb5d664588d6c9"
  license "MIT"
  version "0.0.1-rc.7"

  # Both legion (CLI) and legion-gateway (sidecar) ship in the same archive.
  # On Intel macOS, the x86_64 archive is fetched; arm64 uses on_resource.
  on_macos do
    on_arm do
      url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.7/legion-0.0.1-rc.7-aarch64-apple-darwin.tar.gz"
      sha256 "83f1a16479466cd4f68af067701c61469d41765516158b3845ec760d2389b7a5"
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
