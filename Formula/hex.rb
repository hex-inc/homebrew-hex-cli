class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.07.21"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.21/hex-aarch64-apple-darwin.tar.xz"
      sha256 "40db1aa5725802f94b17dcc9ae992418faa607c63f7e2a5033497f3cd2a7e632"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.21/hex-x86_64-apple-darwin.tar.xz"
      sha256 "adbbeeec72de8f047c29075e24b1e7e0290668e37c155484044bb9cce1615111"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.21/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3e95de9edccd678c43dae7661329d7e31b7ac4c8b2e121f406d9426fe5d40def"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.21/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "33a90719b634c4a366431e4805796b0014898cf92d1863b8253cf0fe343f9762"
    end
  end

  def install
    bin.install "hex"
  end
end
