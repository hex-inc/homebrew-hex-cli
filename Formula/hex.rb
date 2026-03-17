class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "0.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v0.3.0/hex-aarch64-apple-darwin.tar.xz"
      sha256 "af8cfa5c021bd5a0345540a4cc7333855f41eaad8b93b27d7835e07a4e29d9a5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v0.3.0/hex-x86_64-apple-darwin.tar.xz"
      sha256 "4638c3226bd4040a1ee0e7cdd9282b0852d8fd76e843c5e498b9e66f3798e5ad"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v0.3.0/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9551ec446a014668694458c215c37f178ff198fc5cabe71f48bbe1a0554a62da"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v0.3.0/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4ee1211bde442b3ccba9b45deae6f2d207cb54968fec943abdbd1f1fbbdc8971"
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
