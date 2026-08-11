class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.08.11"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.08.11/hex-aarch64-apple-darwin.tar.xz"
      sha256 "661a6e02402d6eedfa12aedbf05f5859cf48e031307602f1d9698084b55e4012"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.08.11/hex-x86_64-apple-darwin.tar.xz"
      sha256 "c1e22774759d1911febd281d6b33dc62d2528793c49eb6528cbddb65fda71356"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.08.11/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b586506abfcc906aa0778744ec2c772e217fa9707be4431cf42d4fe0dfe1bcc0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.08.11/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9872446d1d6bf4c49a11d136ed41ef7c6c649873e0b90829ea352ae2f48b0e8a"
    end
  end

  def install
    bin.install "hex"
  end
end
