class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "0.5.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v0.5.0/hex-aarch64-apple-darwin.tar.xz"
      sha256 "85779eda244fa2a0c631983348385ac22ce270b33989457c29be0e7a33cbb179"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v0.5.0/hex-x86_64-apple-darwin.tar.xz"
      sha256 "eb556f8f892bd3aef637a8bd7a8d016827d65c2000578e48abe0f3d5de8a121e"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v0.5.0/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "fc338b47ed21322834744e9d73410c6c9defd6d4482c934a761881237b3022bb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v0.5.0/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "40ff5c3bdb4ecef0fa2dcf7c9ce58c5c3e1cba14e40bdd8830347c9bae7d1126"
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
