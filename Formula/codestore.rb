class Codestore < Formula
  desc "Command-line interface of code.store"
  homepage "https://code.store/"
  url "https://s3.code.store/codestore-v1.18.21/codestore-v1.18.21-darwin-x64.tar.gz"
  version "1.18.21"
  sha256 "fdd33a142408a2f931e53ffb2dfcbe3f5962705dc873738395d63ad4781db148"
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
