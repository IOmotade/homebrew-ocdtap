class GraywolfAT016 < Formula
  desc "Graywolf v0.1.6"
  homepage "http://opencircuitdesign.com/qrouter/"
  url "https://github.com/rubund/graywolf/archive/refs/tags/0.1.6.zip"
  sha256 "a5ebef668e0ec9c805a142da11f99f21f215e823f9a6620bb5592ae8964a6c4a"

  livecheck do
    url :stable
    regex(%r{url=.*?/graywolf[._-]v?(\d+(?:\.\d+)*)\.t}i)
  end

  head do
    url "git@github.com:rubund/graywolf.git", tag: "0.1.6"
  end

  depends_on "cmake" => :build
  depends_on "gsl" => :build
  depends_on "llvm"
  depends_on "libx11"
  
  def install

    ENV["CFLAGS"] = "-Wno-error=return-type -I/opt/homebrew/opt/gsl/include"
    ENV["CXXFLAGS"] = ENV["CFLAGS"]
    ENV["LDFLAGS"] = "-L/opt/homebrew/opt/gsl/lib"

    # Some nasty seds following https://github.com/rubund/graywolf/issues/47!
    system "sed -i '' -e 's,SET(CMAKE_C_FLAGS.*),SET(CMAKE_C_FLAGS \"${CMAKE_C_FLAGS} -DSIZEOF_VOID_P=${SIZEOF_VOID_P_BITS} -Wno-implicit-function-declaration -Wno-return-type -Wno-format\"),g' CMakeLists.txt"
    
    system 'sed -i '' -e "61s/.*/     char *Yfixpath()\, *strrchr();/g" src/Ylib/relpath.c'
    
    system 'sed -i '' -e "93s,.*,/*,g" src/Ylib/program.c'
    system 'sed -i '' -e "96s,.*,*/,g" src/Ylib/program.c'
    system 'sed -i '' -e "98s,.*,//,g" src/Ylib/program.c'

    system 'sed -i '' -e "1212s,.*,	if (last_chanceG) last_chance() ;,g" src/genrows/draw.c'

    system "mkdir build"
    Dir.chdir("build"){
    system "cmake .. -DCMAKE_INSTALL_PREFIX=#{prefix}"
    system "make"
    system "make", "install"
  }

  end
end
