class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2.1/hex-aarch64-apple-darwin.tar.xz"
      sha256 "ba8cabbd38ba4c7ce4feedd321a6bd472ef4a64bba82eee769b9c9c29273a641"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2.1/hex-x86_64-apple-darwin.tar.xz"
      sha256 "21ffc18f981d72f95bea0b8b737ed567499219a9c104136528e916a67b243166"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2.1/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ba8e48f7779292e01cd7b05547ec3fd40d77dad5776cd86cb0973b8279d56f10"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2.1/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0ad374c31ed6ad2048501f2e66d14662e66113878a40e84c82711b0c674c8c08"
    end
  end

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin": {},
    "x86_64-unknown-linux-gnu": {}
  }

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
      bin.install "hex"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "hex"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "hex"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "hex"
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
