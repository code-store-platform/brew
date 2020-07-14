class Codestore < Formula
  desc "Command-line interface of code.store"
  homepage "https://code.store/"
  url "https://s3.code.store/codestore-v1.3.3/codestore-v1.3.3.tar.gz"
  sha256 "9210905e9448f18ff03df8c6b751e8445137f545f613e60a398891a9c7bc0f24"
  license "MIT"
  depends_on "node@12"

  def install
    inreplace "bin/codestore", /^CLIENT_HOME=/, "export CODESTORE_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/codestore"
    bin.install_symlink libexec/"bin/codestore" => "cs"
  end

  test do
    system bin/"codestore", "version"
  end
end
