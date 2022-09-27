class XcircuitAT31030 < Formula
  desc "XCircuit v3.10.30 Schematic Capture and Netlisting EDA Tool"
  homepage "https://xschem.sourceforge.io/stefan/index.html"
  url "http://opencircuitdesign.com/xcircuit/archive/xcircuit-3.10.30.tgz"
  sha256 "b2f63cba605e79cc2a08714bf3888f7be7174384ed724db3c70f8bf25c36f554"

  livecheck do
    url :stable
    regex(%r{url=.*?/xcircuit[._-]v?(\d+(?:\.\d+)*)\.t}i)
  end

  head do
    url "git://opencircuitdesign.com/xcircuit", tag: "3.10.30"
  end
  
  depends_on "iomotade/ocdtap/tcltk@8.6.10" => :build
  depends_on "cairo" => :build
  depends_on "libx11" => :build
  depends_on "libxpm" => :build

  def install
    
    args = %W[
      --prefix=#{prefix}
      --with-cairo
      --with-tcl
      --with-python
      --enable-args
      --x-includes=/opt/homebrew/include/X11
      --x-libraries=/opt/homebrew/lib/X11
      --with-tcl=/opt/homebrew/Cellar/tcltk@8.6.10/8.6.10/lib
      --with-tk=/opt/homebrew/Cellar/tcltk@8.6.10/8.6.10/lib
      YACC=/opt/homebrew/opt/bison@3.8/bin/bison
      BISON=/opt/homebrew/opt/bison@3.8/bin/bison
    ]
    
    system "./configure", *args
    system "make"
    system "make", "install"

  end
end
