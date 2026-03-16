class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli-dev/releases/download/v0.2.0/hex-aarch64-apple-darwin.tar.xz"
      sha256 "156511351a9ee49a6770e766e3e4c8c280874c2ac117751460acfc580cea9d29"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli-dev/releases/download/v0.2.0/hex-x86_64-apple-darwin.tar.xz"
      sha256 "a6942f22ae22683c1d13388493f9c3f0b49c230effb39dc8966a893e1f33046d"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli-dev/releases/download/v0.2.0/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1b9ff47261c73a495687dc327d661d1bf72708db3149a3e0aef65f543f1dada9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli-dev/releases/download/v0.2.0/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a38aeec51f3c0635667b915fc6a417fb69e3e676a6c1f1670ce434a5148ea3f4"
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
