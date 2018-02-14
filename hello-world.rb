class HelloWorld < Formula
  desc "Program providing model for GNU coding standards and practices"
  homepage "https://www.gnu.org/software/hello/"
  url "https://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz"
  sha256 "31e066137a962676e89f69d1b65382de95a7ef7d914b8cb956f41ea72e0f516b"
  revision 1

  bottle do
    root_url "https://github.com/randy3k/homebrew-hello-world/releases/download/hello-world-bottle"
    rebuild 1
    sha256 "fae0e42493cfbcfd34f87fdee58d8d06afad77325183ab7fe01b86de9255d805" => :sierra_or_later
    sha256 "b5abae47ccfdd4285f67bbb80b19c3922f7f5e0e3a03985ae8fe53bdd37f329b" => :x86_64_linux
  end

  conflicts_with "camlistore", :because => "both install `hello` binaries"
  conflicts_with "hello", :because => "both install `hello` binaries"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
  test do
    assert_equal "brew", shell_output("#{bin}/hello --greeting=brew").chomp
  end
end
