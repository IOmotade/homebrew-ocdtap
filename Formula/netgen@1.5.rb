class NetgenAT15 < Formula
  desc "Netgen v1.5 Netlist Comparison(LVS) and Format Manipulation"
  homepage "http://opencircuitdesign.com/netgen/"
  url "http://opencircuitdesign.com/netgen/archive/netgen-1.5.233.tgz"
  sha256 "31d0d964892810b63b7450cc6614c64e8b4b7c681ddce1393692ccf39ae760ba"

  livecheck do
    url :stable
    regex(%r{url=.*?/netgen[._-]v?(\d+(?:\.\d+)*)\.t}i)
  end

  head do
    url "git://opencircuitdesign.com/netgen", branch: "netgen-1.5"
  end

  depends_on "iomotade/ocdtap/tcltk@8.6.10" => :build
  
  def install
        
    args = %W[
      --prefix=#{prefix}
      --with-tcl=/opt/homebrew/Cellar/tcltk@8.6.10/8.6.10/lib
      --with-tk=/opt/homebrew/Cellar/tcltk@8.6.10/8.6.10/lib
    ]
    
    system "./configure", *args
    system "make"
    system "make", "install"
    
  end

end
