class Hex < Formula
  desc "Hex CLI"
  homepage "https://hex.tech"
  version "1.2026.06.05"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/homebrew-hex-cli/releases/download/v1.2026.06.05/hex-aarch64-apple-darwin.tar.xz"
      sha256 "923710fca326a8cb33833ffe7829473855e0857f4296175a6af10dc0ce6569ec"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/homebrew-hex-cli/releases/download/v1.2026.06.05/hex-x86_64-apple-darwin.tar.xz"
      sha256 "e5a02b68c8524454d5d66f7983a5a1f6b45f9aee65a8876cf32f1c6b1d71f5c4"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/hex-inc/homebrew-hex-cli/releases/download/v1.2026.06.05/hex-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "14a3f36f66fb34e2b52b2bb1b0a2739b96500c0f4aa09e346b48e7c88bc33c3e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/hex-inc/homebrew-hex-cli/releases/download/v1.2026.06.05/hex-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4f6fb1aa55e84ec59ff0815d178ef86d63399d0a01304e70a8b16672caf6ba26"
    end
  end

  def install
    bin.install "hex"
  end
end
