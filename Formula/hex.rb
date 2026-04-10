class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.1.0/hex-aarch64-apple-darwin.tar.xz"
      sha256 "b1867dab54d946244b6920eb3bd1c556d48d530914618a4814769c7cdb7800a4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.1.0/hex-x86_64-apple-darwin.tar.xz"
      sha256 "525eb362d836dc1fd91d9f47b654e612a38f639ea348454eac9f9aaab8808b99"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.1.0/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "39b0f93e0652d4ba43e9a38b30885b30a92cc8c078ed98097943dd8debf0c0df"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.1.0/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "54aec0e392c301973190157bdd0232d57b9c5c3303b386b1f1ab558e06842f14"
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
