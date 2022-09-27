class IrsimAT97114 < Formula
  desc "IRSim v9.7.114 Switch-Level Simulator for Digital Circuits"
  homepage "http://opencircuitdesign.com/irsim/"
  url "http://opencircuitdesign.com/irsim/archive/irsim-9.7.114.tgz"
  sha256 "f65a058234f6a5a0289d45aed285165e8cc30b30c36c7080c38fe784231e5141"

  livecheck do
    url :stable
    regex(%r{url=.*?/irsim[._-]v?(\d+(?:\.\d+)*)\.t}i)
  end

  head do
    url "git://opencircuitdesign.com/irsim", tag: "9.7.114"
  end
  
  depends_on "iomotade/ocdtap/tcltk@8.6.10" => :build
  depends_on "glfw" => :build
  depends_on "glew" => :build

  def install
        
    args = %W[
      --prefix=#{prefix}
      --with-opengl
      --with-tcl=/opt/homebrew/Cellar/tcltk@8.6.10/8.6.10/lib
      --with-tk=/opt/homebrew/Cellar/tcltk@8.6.10/8.6.10/lib
      --x-includes=/opt/homebrew/include/X11
      --x-libraries=/opt/homebrew/lib/X11
    ]

    ENV["CFLAGS"] = "-Wno-error=implicit-function-declaration"
    
    system "./configure", *args
    system "make"
    system "make", "install"
    
  end
end
