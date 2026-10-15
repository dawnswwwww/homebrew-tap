# Homebrew formula template for Legion.
#
# The release workflow renders this into Formula/legion.rb in the
# dawnswwwww/homebrew-tap tap, substituting 0.0.1-rc.7, e7659fdc588bfcd20d97459c92ee18e6e3883ce8eb50591e8312d9b83313c663,
# and 7dcc26441fc7f654a0f9a1cd44ec495341aa19b05686a92bdd81fdd1127433c4.
#
# Users install via:  brew install dawnswwwww/tap/legion
class Legion < Formula
  desc "Self-hosted, multi-channel AI agent gateway and CLI"
  homepage "https://github.com/dawnswwwww/uselegion"
  url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.7/legion-0.0.1-rc.7-x86_64-apple-darwin.tar.gz"
  sha256 "7dcc26441fc7f654a0f9a1cd44ec495341aa19b05686a92bdd81fdd1127433c4"
  license "MIT"
  version "0.0.1-rc.7"

  # Both legion (CLI) and legion-gateway (sidecar) ship in the same archive.
  # On Intel macOS, the x86_64 archive is fetched; arm64 uses on_resource.
  on_macos do
    on_arm do
      url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.7/legion-0.0.1-rc.7-aarch64-apple-darwin.tar.gz"
      sha256 "e7659fdc588bfcd20d97459c92ee18e6e3883ce8eb50591e8312d9b83313c663"
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
