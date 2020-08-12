class Codestore < Formula
  desc "Command-line interface of code.store"
  homepage "https://code.store/"
  url "https://s3.code.store/codestore-v1.5.2/codestore-v1.5.2-darwin-x64.tar.gz"
  version "1.5.2"
  sha256 "cf600c90079fe7d275cd2bfd8191d1d26e211168cbf8232d79c09df13a9b52c5"
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
