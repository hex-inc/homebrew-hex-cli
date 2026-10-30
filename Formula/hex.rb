class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.10.30"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.30/hex-aarch64-apple-darwin.tar.xz"
      sha256 "d98648784e7e85719ab2658a37a26f426be009060febbc8bac54da0e1a8da5bd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.30/hex-x86_64-apple-darwin.tar.xz"
      sha256 "5414f7eb32641d908185c3b33ee8988d9d4b77cbedbcbead2987716e91bd0fe4"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.30/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "88464afbfc704148ddb8367d7d460354ccd69bf0df26126e00e0bda4fe5f7536"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/hex-cli/releases/download/v1.2026.10.30/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8931a779d60dc796dd1220e4ecf966d6ad75a4ab83069b05c076381ecac32720"
    end
  end

  def install
    bin.install "hex"
  end
end
