class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.10.09"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.09/hex-aarch64-apple-darwin.tar.xz"
      sha256 "f8bf314718d107cb9449a694de28507709d7264ea3793861ef1a35cf7106de79"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.09/hex-x86_64-apple-darwin.tar.xz"
      sha256 "97c7b331f306892620d3d9f5bf47c49c16ec0e2317a17aaba46935efaa04e93a"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.09/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0541bda58134b534626683796fdb446477692d2acf366b3cc0e7c0ff4375afc5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.09/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "260144772e1f2665efd80f608b1d4a5b3885f9b915c9c3e86a9d89e47fc6b4f7"
    end
  end

  def install
    bin.install "hex"
  end
end
