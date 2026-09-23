class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.09.23"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.09.23/hex-aarch64-apple-darwin.tar.xz"
      sha256 "0003bebb7412b65c0bb7ee4febd9576f025f8e631be6e6f8510a4cc4ea4cb59e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.09.23/hex-x86_64-apple-darwin.tar.xz"
      sha256 "a2b579374abe363e75ac13037eebb896b65206ed08294b61d26fa8c9a652f1b6"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.09.23/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a6083e034c9f43f370a90dc04146b11eb060483d5bba44c358e50a94ce113cc5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.09.23/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3845656a02f992b6bc50a8467bc18e19f52ce38a29be6b43ed13de5b8a1e34f2"
    end
  end

  def install
    bin.install "hex"
  end
end
