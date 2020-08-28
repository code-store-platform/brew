class Codestore < Formula
  desc "Command-line interface of code.store"
  homepage "https://code.store/"
  url "https://s3.code.store/codestore-v1.9.6/codestore-v1.9.6-darwin-x64.tar.gz"
  version "1.9.6"
  sha256 "93a6fc69c5100d203e515cf89ae5ce4de7afdac27c75342ce9e9dbe96b61085e"
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
