class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.10.16.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.16.1/hex-aarch64-apple-darwin.tar.xz"
      sha256 "29db54af8d4c259522b49813d5092711301137bbea9559d86d3dc3bc00888c8e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.16.1/hex-x86_64-apple-darwin.tar.xz"
      sha256 "20233dcf96054f0b3a7b947f15f64dd864146901365d259291c53b992a59fec8"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.16.1/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c293f5289c6e85fa2431ef227b939a982071fd450a99479a5328cdb20c8d9a88"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.16.1/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "89e5268ad164a1a8aeeece754d6a43c5691a88e08c03aa702eea3af4c10ce58a"
    end
  end

  def install
    bin.install "hex"
  end
end
