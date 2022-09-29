class QrouterAT1485 < Formula
  desc "QRouter v1.4.85 Multi-Level Over-the-cell Maze Router for Digital ASIC Designs"
  homepage "http://opencircuitdesign.com/qrouter/"
  url "http://opencircuitdesign.com/qrouter/archive/qrouter-1.4.85.tgz"
  sha256 "f73d50ac3e195fe3229b3953e20f796fb5b1e6cf7db70b689055a037949fe9c3"

  livecheck do
    url :stable
    regex(%r{url=.*?/qrouter[._-]v?(\d+(?:\.\d+)*)\.t}i)
  end

  head do
    url "git://opencircuitdesign.com/qrouter", tag: "1.4.85"
  end
  
  depends_on "iomotade/ocdtap/tcltk@8.6.10" => :build
  
  def install
        
    args = %W[
      --prefix=#{prefix}
      --with-x
      --with-tcl=/opt/homebrew/Cellar/tcltk@8.6.10/8.6.10/lib
      --with-tk=/opt/homebrew/Cellar/tcltk@8.6.10/8.6.10/lib
      --x-includes=/opt/homebrew/include/X11
      --x-libraries=/opt/homebrew/lib/X11
    ]

    system "./configure", *args
    system "make"
    system "make", "install"

    args = %W[
      #{prefix}/share/qrouter/qrouter.dylib
      #{prefix}/share/qrouter/qrouter.so
    ]

    system "cp", *args
    
  end
end
