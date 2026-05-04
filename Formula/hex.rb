class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.3.0/hex-aarch64-apple-darwin.tar.xz"
      sha256 "94323d20fac083f9be6bbe610393333acbc0a39f686c93b995d179d095995ded"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.3.0/hex-x86_64-apple-darwin.tar.xz"
      sha256 "0ca39bb0850b0140c9449d3a29462648b2b4988423f13da53d3e2d7f18bcca24"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.3.0/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "284743e6a58d4a98ec7b457673ddd948c54069fcbd67826cde34b4cd4b48d8ae"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.3.0/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "375d08789afec2529d71373a6326ba638720031e44a094cb7f10538a60ca31a3"
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
