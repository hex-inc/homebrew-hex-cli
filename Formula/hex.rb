class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "0.4.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v0.4.0/hex-aarch64-apple-darwin.tar.xz"
      sha256 "a8b4226583dc3065a0e2307826fc6742ebbff9b1ee5d868851675043c54f597f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v0.4.0/hex-x86_64-apple-darwin.tar.xz"
      sha256 "b16d34641fa32c9d5af27c3ffc9067ccb411070bf23e13ad9a665f47c788dcc4"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v0.4.0/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "51e1f576b02542e7acd77a44f85e4fea889533f55e427ec6cc0426f646dc68b5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v0.4.0/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "fb0889ca97402486f765fe7a68443bbee89c2d3c666ca5959f2efb84909cc639"
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
