class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.08.04"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.08.04/hex-aarch64-apple-darwin.tar.xz"
      sha256 "e72fd5620aab710a58ae587c32010c6691bb8c41e77b4b628995e27800c45115"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.08.04/hex-x86_64-apple-darwin.tar.xz"
      sha256 "4e914f6efd284a1aab23556f4bc1d2e44a89e78ccf1bf24cd9c6be9c23523386"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.08.04/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4b338c27efd7accab66fe7491d9248c3c90c0a32164048fe9cc45d9b3ddfd4ef"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.08.04/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6fc7de95033bacd6da90ebaeaaa54c082ddb682a9fdd0bd399a23dfe16c6801d"
    end
  end

  def install
    bin.install "hex"
  end
end
