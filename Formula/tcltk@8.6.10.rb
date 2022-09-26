class TcltkAT8610 < Formula
  desc "Tcl and Tk Version 8.6.10"
  homepage "https://www.tcl.tk"
  url "https://prdownloads.sourceforge.net/tcl/tcl8.6.10-src.tar.gz"
  sha256 "5196dbf6638e3df8d5c87b5815c8c2b758496eb6f0e41446596c9a4e638d87ed"

  livecheck do
    url :stable
    regex(%r{url=.*?/tcltk[._-]v?(\d+(?:\.\d+)*)\.t}i)
  end

  head do
    url "https://github.com/tcltk/tcl.git", branch: "main"
  end

  depends_on "libx11" => :build

  def install
    
    # Install Tcl
    args = %W[
      --prefix=#{prefix}
    ]
    
    Dir.chdir("unix"){
      system "./configure", *args
      system "make", "install"
    }

    # Install Tk
    system "/opt/homebrew/bin/wget https://prdownloads.sourceforge.net/tcl/tk8.6.10-src.tar.gz"
    system "tar -xvzf tk8.6.10-src.tar.gz"

    args = %W[
      --prefix=#{prefix}
      --with-tcl=/opt/homebrew/Cellar/tcltk@8.6.10/8.6.10/lib
      --with-tk=/opt/homebrew/Cellar/tcltk@8.6.10/8.6.10/lib
      --x-includes=/opt/homebrew/include/X11
      --x-libraries=/opt/homebrew/lib/X11
    ]

    ENV["CFLAGS"] = "-Wno-error=implicit-function-declaration"
    ENV["LIB_RUNTIME_DIR"] = "$(libdir)"
    
    Dir.chdir("tk8.6.10/unix"){
      system "./configure", *args
      system "make"
      # system "sed -i '' -e 's,LIB_RUNTIME_DIR.*= $(libdir):/opt/X11/lib,LIB_RUNTIME_DIR = $(libdir),g' Makefile"
      system "make", "install"
      system "install_name_tool /opt/homebrew/Cellar/tcltk@8.6.10/8.6.10/bin/wish8.6 -change /opt/homebrew/Cellar/tcltk@8.6.10/8.6.10/lib:/opt/homebrew/lib/X11/libtk8.6.dylib /opt/homebrew/Cellar/tcltk@8.6.10/8.6.10/lib/libtk8.6.dylib"
    }

  end

end
