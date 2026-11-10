class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.11.10"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.11.10/hex-aarch64-apple-darwin.tar.xz"
      sha256 "b082c908e3274b131f6083b0671e1ca8c1d88f7ae2f5396751a1dc1ba358cd33"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.11.10/hex-x86_64-apple-darwin.tar.xz"
      sha256 "f26e2c09eb1d1578756248f74ab637c6f438fc2927f52ad50239a4023c813b71"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.11.10/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "98a6f3c31192ad1427412207de4b836deee1cdf00ecffe03df38c48813650284"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.11.10/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c340e28246cdaa24602409969707aa80aa1edcad19cbc259e07abaa75fb0f4a4"
    end
  end

  def install
    bin.install "hex"
  end
end
