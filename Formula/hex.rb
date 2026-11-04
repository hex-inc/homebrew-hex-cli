class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.11.04"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.11.04/hex-aarch64-apple-darwin.tar.xz"
      sha256 "2a77b2f5c682e774d971a0a9a55a8bfce0062e465c5d8b1eb5cdda8baa71d645"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.11.04/hex-x86_64-apple-darwin.tar.xz"
      sha256 "34b0961c967c93a3a2443f39dafc5f9d6faecc382906be9a87bac57df9ef5f38"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.11.04/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d695ce8c656f46edd5705d2a5dafa75cc2e928288b7a16d99bbd4b5788d4b2b8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.11.04/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2a6abec62566f99f5ea4a62e18f04e7fb0a9a3f722f34760f5226cad67981fd9"
    end
  end

  def install
    bin.install "hex"
  end
end
