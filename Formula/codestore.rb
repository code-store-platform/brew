class Codestore < Formula
  desc "Command-line interface of code.store"
  homepage "https://code.store/"
  url "https://s3.code.store/codestore-v1.4.15/codestore-v1.4.15-darwin-x64.tar.gz"
  version "1.4.15"
  sha256 "1311876a666d3e6910803ca679ddaecdc53af588a662ad42e09634b015e1c4c0"
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
