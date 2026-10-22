class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.10.22"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.22/hex-aarch64-apple-darwin.tar.xz"
      sha256 "956dcf0f0c62554497e72b85f2f256b6f3f989e4973cd62911651c2f4ad3ca12"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.22/hex-x86_64-apple-darwin.tar.xz"
      sha256 "5dcd662f98273cd46ef71b339fe17e25eecf9dd3eff4e3fc9e3fe2ac6ad5136f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.22/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f0d18dae1928e3a078ed7409531dd878717eda60ecce772e5795c260fbad1eeb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.22/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "12ae155e74df7fad2bf6ac9dcc9cb330a0b3626fbe5ae2ceea976fd3e8ea87c3"
    end
  end

  def install
    bin.install "hex"
  end
end
