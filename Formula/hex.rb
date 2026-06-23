class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.06.23"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.06.23/hex-aarch64-apple-darwin.tar.xz"
      sha256 "064eda1951d3d3746d2c069eb844133b832603c2273fe467b9e4c6e4c5ae1ef1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.06.23/hex-x86_64-apple-darwin.tar.xz"
      sha256 "d78fe9d730f1eb9b240d8f98816ebdb93e8f9c1b66e1fa9d8fa9552045298635"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.06.23/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "cda2aadfdb789406c211f7952a6e07084eee678cbd25cf6df6bcbe8e4e851a40"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.06.23/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d746940667db7336a9b521725ef9523b84a59161d1a25afd0dfe424b5a07a785"
    end
  end

  def install
    bin.install "hex"
  end
end
