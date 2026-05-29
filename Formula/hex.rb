class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.05.29"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.05.29/hex-aarch64-apple-darwin.tar.xz"
      sha256 "2563e30e6f8a73d193780467faea17af4dc30e0dcd6d10248cd1cff83f33f09c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.05.29/hex-x86_64-apple-darwin.tar.xz"
      sha256 "805a311c59abcf4e5d8a0d00af4971db226019ff4a172141578cbfd4d2eaeef9"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.05.29/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0cc3c864d1f440d978273cb6dd5d27a8c5d585fa596aec44dc4c101d15b43486"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.05.29/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f9c2afe26b434fd0a64aafd40d2a80968e118a4fd00f7dcb8f9a19ce76b66837"
    end
  end
  def install
    binary = Dir["hex-*/hex"].first
    bin.install binary => "hex"
  end
end
