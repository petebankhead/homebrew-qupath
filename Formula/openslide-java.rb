class OpenslideJava < Formula
  desc "Java bindings to OpenSlide"
  homepage "https://openslide.org/"
  url "https://github.com/openslide/openslide-java/archive/refs/tags/v0.12.2.tar.gz"
  sha256 "d4163c9c38232d6eedd492e71d9a8ea7f1b8134bcd311e27a4e90099f0261620"
  license "LGPL-2.1-only"

  depends_on "ant" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "openjdk" => :build
  depends_on "pkg-config" => :build
  depends_on "openjdk" => :test
  depends_on "openslide"

  resource "svs" do
    url "https://openslide.cs.cmu.edu/download/openslide-testdata/Aperio/CMU-1-Small-Region.svs"
    sha256 "ed92d5a9f2e86df67640d6f92ce3e231419ce127131697fbbce42ad5e002c8a7"
  end

  def install
    # Minimum JDK 8 when building with OpenJDK for M1
    inreplace "./build.xml", "value=\"1.6\"", "value=\"1.8\""

    system "autoreconf", "-i"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "JAVA_HOME=#{Formula["openjdk"].prefix}"
    system "make", "install"
  end

  test do
    resource("svs").stage do
      system Formula["openjdk"].bin/"java",
               "-cp", lib/"openslide-java/openslide.jar",
               "org.openslide.TestCLI", "CMU-1-Small-Region.svs"
    end
  end
end
