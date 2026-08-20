class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.08.20"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.08.20/hex-aarch64-apple-darwin.tar.xz"
      sha256 "2157c9652697c728ac54b8a3916e1131aa6073724508f2bfa12ca52b43cb7a3e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.08.20/hex-x86_64-apple-darwin.tar.xz"
      sha256 "19b0c18c29ed391cd00fbdeb0b20b0764e8dad8afe515625868c2fd4946d0cdc"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.08.20/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "e66a873c17b36eb61784e67ca49b5b004179f88c47156ee883aac8b272328999"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.08.20/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5d599c5062720b71d9cfab4f7dd7420563a937edbd435bc8cdd553b229c80449"
    end
  end

  def install
    bin.install "hex"
  end
end
