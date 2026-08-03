# Homebrew formula template for Legion.
#
# The release workflow renders this into Formula/legion.rb in the
# dawnswwwww/homebrew-tap tap, substituting 0.0.1-rc.1, f9d7072eabe45eda10444e9d4f8e88e437e4e82a647a41b7f8cdef604f241ccf,
# and ab0b6d00627fe2e0e0500fd42b5354dd6dc71e8b8cbff462462ca94a4927233f.
#
# Users install via:  brew install dawnswwwww/tap/legion
class Legion < Formula
  desc "Self-hosted, multi-channel AI agent gateway and CLI"
  homepage "https://github.com/dawnswwwww/uselegion"
  url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.1/legion-0.0.1-rc.1-x86_64-apple-darwin.tar.gz"
  sha256 "ab0b6d00627fe2e0e0500fd42b5354dd6dc71e8b8cbff462462ca94a4927233f"
  license "MIT"
  version "0.0.1-rc.1"

  # Both legion (CLI) and legion-gateway (sidecar) ship in the same archive.
  # On Intel macOS, the x86_64 archive is fetched; arm64 uses on_resource.
  on_macos do
    on_arm do
      url "https://github.com/dawnswwwww/uselegion/releases/download/v0.0.1-rc.1/legion-0.0.1-rc.1-aarch64-apple-darwin.tar.gz"
      sha256 "f9d7072eabe45eda10444e9d4f8e88e437e4e82a647a41b7f8cdef604f241ccf"
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
