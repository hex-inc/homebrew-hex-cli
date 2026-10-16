class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.10.16"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.16/hex-aarch64-apple-darwin.tar.xz"
      sha256 "940b221b3a37fd510a3341e220815a31ff96cec38efca4e55dc928a92f244236"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.16/hex-x86_64-apple-darwin.tar.xz"
      sha256 "9ab0ccaacf7ab5e08ab64031dd4a69e909b906f084a79c1e21a50e08e853e44b"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.16/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "24e3202b6537b56ec7675e4007667c5c2eca6988d118c3dfd3267bc6553fe567"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.16/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e6e9ec5129c8750e5b827a14c3c2a94a80d539d80c9b9f18a8eebbccb9f471b4"
    end
  end

  def install
    bin.install "hex"
  end
end
