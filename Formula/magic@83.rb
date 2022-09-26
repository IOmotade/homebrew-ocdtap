class MagicAT83 < Formula
  desc "Magic v8.3 VLSI Layout Tool"
  homepage "http://opencircuitdesign.com/magic/"
  url "http://opencircuitdesign.com/magic/archive/magic-8.3.326.tgz"
  sha256 "4256379ea62b1b6a30555bf5d670295474b394917a688c1917ac537609f348c9"

  livecheck do
    url :stable
    regex(%r{url=.*?/magic[._-]v?(\d+(?:\.\d+)*)\.t}i)
  end

  head do
    url "git://opencircuitdesign.com/magic", branch: "magic-8.3"
  end

  def install
        
    args = %W[
      --prefix=#{prefix}
      --with-tcl=/opt/homebrew/Cellar/tcltk@8.6/8.6.10/lib
      --with-tk=/opt/homebrew/Cellar/tcltk@8.6/8.6.10/lib
      --x-includes=/opt/homebrew/include/X11
      --x-libraries=/opt/homebrew/lib/X11
    ]

    ENV["CFLAGS"] = "-Wno-error=implicit-function-declaration"
    
    system "./configure", *args
    system "make"
    system "make", "install"
    
  end

end
