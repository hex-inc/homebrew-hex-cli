class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.08.14"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.08.14/hex-aarch64-apple-darwin.tar.xz"
      sha256 "7c8d12d1b622d26dd5b3acc35e10677f1d2fc06c792b2d44589f1546a0fe6761"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.08.14/hex-x86_64-apple-darwin.tar.xz"
      sha256 "853da1dbd437e5b323af6517291ab9b4072ddc3107fb7992b7c0b29f9387f226"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.08.14/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6bdd2a975411d56ebcf5b2283e01498754b797958f3a868dff1c48c861fca61d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.08.14/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e00243881df5efd12b787d0fca4c6211d8e97d194f5eb34a0b1555be9efe5662"
    end
  end

  def install
    bin.install "hex"
  end
end
