class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.05.20"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.05.20/hex-aarch64-apple-darwin.tar.xz"
      sha256 "0795bc0d157698d437daededd2f1bdcfd5a49487ebe26f49f596771ae5ef299a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.05.20/hex-x86_64-apple-darwin.tar.xz"
      sha256 "c7f00c715f4641ec3ab228c68042d271cb496f2cec55ad7567b53da2047312e7"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.05.20/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "368f086eb868d2a282692c43949782a8e73424c98913b37925b5f3795a2d094f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.05.20/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "79c47535398b9cae190dbc2a84f3935c6379ed53ba227aa83c9363a8071e5ba0"
    end
  end

  def install
    bin.install "hex"
  end
end
