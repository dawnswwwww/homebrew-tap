class Swixter < Formula
  desc "CLI tool for managing AI coding assistant configurations - switch between providers (Claude Code, Codex, Continue) with Anthropic, Ollama, or custom APIs"
  homepage "https://github.com/dawnswwwww/swixter"
  version "0.2.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dawnswwwww/swixter/releases/download/v0.2.3/swixter-aarch64-apple-darwin.tar.xz"
      sha256 "ebf896d9ae23f3f97636e362fbfec9d2f0f7c4440f02687158e68639727d8033"
    end
    if Hardware::CPU.intel?
      url "https://github.com/dawnswwwww/swixter/releases/download/v0.2.3/swixter-x86_64-apple-darwin.tar.xz"
      sha256 "064baa276e60bbe7ba6b3a7267c87aa5b75edc7a40001d42c781ba9b428db57e"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/dawnswwwww/swixter/releases/download/v0.2.3/swixter-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ab981700d38eb75e4c2804364712b34b56bc6923a52b9c3adebc95f760956931"
    end
    if Hardware::CPU.intel?
      url "https://github.com/dawnswwwww/swixter/releases/download/v0.2.3/swixter-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d2b4158bb2bab071f730c02af5ec2b5b198fe913b10068c70053933a3b192ad5"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":               {},
    "aarch64-unknown-linux-gnu":          {},
    "aarch64-unknown-linux-musl-dynamic": {},
    "aarch64-unknown-linux-musl-static":  {},
    "x86_64-apple-darwin":                {},
    "x86_64-pc-windows-gnu":              {},
    "x86_64-unknown-linux-gnu":           {},
    "x86_64-unknown-linux-musl-dynamic":  {},
    "x86_64-unknown-linux-musl-static":   {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "swixter"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "swixter"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "swixter"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "swixter"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
