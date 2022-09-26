class NgspiceAT37 < Formula
  desc "Spice circuit simulator"
  homepage "https://ngspice.sourceforge.io/"
  url "https://downloads.sourceforge.net/project/ngspice/ng-spice-rework/37/ngspice-37.tar.gz"
  sha256 "9beea6741a36a36a70f3152a36c82b728ee124c59a495312796376b30c8becbe"

  livecheck do
    url :stable
    regex(%r{url=.*?/ngspice[._-]v?(\d+(?:\.\d+)*)\.t}i)
  end

  head do
    url "https://git.code.sf.net/p/ngspice/ngspice.git", branch: "master"

    
  
    depends_on "bison" => :build
  end

  depends_on "autoconf"
  depends_on "automake"
  depends_on "iomotade/maintap/adms@236"
  depends_on "llvm"
  depends_on "libtool"
  depends_on "libomp"
  depends_on "fftw"
  depends_on "readline"
  depends_on "libx11" => :build
  depends_on "libxaw" => :build
  depends_on "libxft" => :build
  depends_on "freetype" => :build
  
  #ENV.prepend_path "PATH", which("admsXml").dirname
  #ENV.prepend_path "PATH", File.realpath("admsXml")
  

  def install
    system "/opt/homebrew/bin/wget https://sourceforge.net/projects/ngspice/files/ng-spice-rework/37/ngspice-adms-va.7z/download"
   
    system "/opt/homebrew/bin/7za x download -o./src/spicelib/devices/adms"
    
    ENV["CC"] = "/opt/homebrew/opt/llvm/bin/clang"
    ENV["CXX"] = "/opt/homebrew/opt/llvm/bin/clang++"
    ENV["CFLAGS"] = "-I/opt/homebrew/opt/readline/include -I/opt/homebrew/include/freetype2 -I/opt/homebrew/include -I/opt/homebrew/opt/llvm/include"
    ENV["CXXFLAGS"] = ENV["CFLAGS"]
    ENV["LDFLAGS"] = "-L/opt/homebrew/opt/readline/lib -L/opt/homebrew/opt/freetype2/lib -L/opt/homebrew/opt/libomp/lib -L/opt/homebrew/opt/llvm/lib"

    system "./autogen.sh --adms" #if build.head?
    
    #system "export PATH='$PATH:${HOME}/eee/ocd/tools/cad/adms/bin'"
    
    
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
      --enable-adms
      --enable-cider
      --enable-xspice
      --enable-openmp
      --enable-pss
      --with-readline=yes
      --x-includes=/opt/homebrew/include/X11
      --x-libraries=/opt/homebrew/lib/X11
      YACC=/opt/homebrew/opt/bison@3.8/bin/bison
      BISON=/opt/homebrew/opt/bison@3.8/bin/bison
    ]
    
    #CFLAGS=-I/opt/homebrew/include/freetype2 -I/opt/homebrew/include
    #LDFLAGS=-L/opt/homebrew/opt/freetype2/lib -L/opt/homebrew/opt/libomp/lib

    system "./configure", *args
    system "make", "install"

    # remove conflict lib files with libngspice
    rm_rf Dir[lib/"ngspice"]
  end

  test do
    (testpath/"test.cir").write <<~EOS
      RC test circuit
      v1 1 0 1
      r1 1 2 1
      c1 2 0 1 ic=0
      .tran 100u 100m uic
      .control
      run
      quit
      .endc
      .end
    EOS
    system "#{bin}/ngspice", "test.cir"
  end
end
