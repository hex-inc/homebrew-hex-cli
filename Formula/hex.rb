class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "0.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli-dev/releases/download/v0.1.1/hex-aarch64-apple-darwin.tar.xz"
      sha256 "e50150d257d295d93ed3b0e916ba6a7c066c40254b02fe51b9364fa977569d3a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli-dev/releases/download/v0.1.1/hex-x86_64-apple-darwin.tar.xz"
      sha256 "e7c7d856b1d980cb070b20a56f7a5620a7f932124a0a01cccc4cb03504008f4a"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli-dev/releases/download/v0.1.1/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "32cec253c375844d1b816c1bc1e65d4dd895ef13025236489e22389de8efe517"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli-dev/releases/download/v0.1.1/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "afec57815b496cd581638a2d03a5e1f8209f94bd4a522673d26f996180a43808"
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
