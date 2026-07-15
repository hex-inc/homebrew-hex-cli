class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.07.15"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.15/hex-aarch64-apple-darwin.tar.xz"
      sha256 "eb681241c347d19b60f94aac40a99d4cf2db920488dad5fb3a4ff41e44736db5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.15/hex-x86_64-apple-darwin.tar.xz"
      sha256 "94519c197b97326e8192fa36d8019485449750029efeadcdb9a37dc4f8035287"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.15/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9abc2f788bedad84945d1464bb52d0a106d2fd2872f8a91909dee7ca1f2b487e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.07.15/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "89f27e117d42b44b543d78c3610fb5bd641784cb66c592794346ca08a337fa98"
    end
  end

  def install
    bin.install "hex"
  end
end
