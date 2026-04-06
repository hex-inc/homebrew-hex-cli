class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.0.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.0.0/hex-aarch64-apple-darwin.tar.xz"
      sha256 "cd33e9778d073cb0d6366ea6a5fd09472abcc38664921f3c726962c6a5145f97"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.0.0/hex-x86_64-apple-darwin.tar.xz"
      sha256 "91c5e4398491cb570ad16864d10877ef0387cdb0570f56544a97dfa7284787d9"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.0.0/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0120fa3366abaceb405cc7c35afd88c7920fb75dff4157ee790b79c20447b167"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.0.0/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f1f59a6d9d8aacc23b867337de0d75906c4740b34dda5345d5b8399f4b1ee7bd"
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
    if OS.mac? && Hardware::CPU.arm?
      bin.install "hex"
      generate_completions_from_executable(bin/"hex", "completions")
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "hex"
      generate_completions_from_executable(bin/"hex", "completions")
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "hex"
      generate_completions_from_executable(bin/"hex", "completions")
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "hex"
      generate_completions_from_executable(bin/"hex", "completions")
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
