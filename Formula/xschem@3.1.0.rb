class XschemAT310 < Formula
  desc "XSCHEM v3.1.0 Schematic Capture and Netlisting EDA Tool"
  homepage "https://xschem.sourceforge.io/stefan/index.html"
  url "http://repo.hu/projects/xschem/releases/xschem-3.1.0.tar.gz"
  sha256 "50cc069e3256197cecbab0044aabff985eca0eb92be431bd3c0d5e41feb3f509"

  livecheck do
    url :stable
    regex(%r{url=.*?/xschem[._-]v?(\d+(?:\.\d+)*)\.t}i)
  end

  head do
    url "https://github.com/StefanSchippers/xschem.git", tag: "3.1.0"
  end

  depends_on "libx11" => :build
  depends_on "libxpm" => :build
  depends_on "iomotade/maintap/tcltk@8.6.10" => :build

  def install
    
    args = %W[
      --prefix=#{prefix}
    ]
    
    ENV["CFLAGS"] = "-O2"
    ENV["LIB_RUNTIME_DIR"] = "$(libdir)"
    
    system "./configure", *args
    system "make"
    system "make", "install"

  end

end
