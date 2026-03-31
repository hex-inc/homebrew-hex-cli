class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "0.7.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v0.7.0/hex-aarch64-apple-darwin.tar.xz"
      sha256 "031df26e1b533713a73fd718785e2798c9fbfe30807264c156c8bcf7202d5251"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v0.7.0/hex-x86_64-apple-darwin.tar.xz"
      sha256 "2e294b09f51b9ee8a74c33dc7a74a8927975eba0196cab846c424c154a42d262"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v0.7.0/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "5868944ca1f6f4ec17535dee7e05db8ed6b8a17786e212a6974bbeeeaab79104"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v0.7.0/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f60b644db7b64b797d9e1461e39f14fd1ff000620a536ef2ccf37061f9e46676"
    end
  end
  license "UNLICENSED"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-unknown-linux-gnu":  {},
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
    bin.install "hex" if OS.mac? && Hardware::CPU.arm?
    bin.install "hex" if OS.mac? && Hardware::CPU.intel?
    bin.install "hex" if OS.linux? && Hardware::CPU.arm?
    bin.install "hex" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
