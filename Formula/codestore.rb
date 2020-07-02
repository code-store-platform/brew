class Codestore < Formula
  desc "Command-line interface of code.store"
  homepage "https://code.store/"
  url "https://s3.eu-central-1.amazonaws.com/s3.code.store/codestore-v1.2.9/codestore-v1.2.9.tar.gz"
  sha256 "1b502ad0f3bbf8ad064cb98da8effaf062459e7f633b87082be070d69da61f04"
  license "MIT"
  depends_on "node"

  def install
    inreplace "bin/codestore", /^CLIENT_HOME=/, "export CODESTORE_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/codestore"
  end

  test do
    system bin/"codestore", "version"
  end
end
