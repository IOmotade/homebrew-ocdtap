import sys

PREFIX = sys.argv[1]
VERSION_NO = sys.argv[2]

TMP_DIR = f"{PREFIX}/tmp"
BUILD_DIR = f"{TMP_DIR}"
SHARE_DIR = f"{PREFIX}/share"
PDK_DIR = f"{PREFIX}/share/pdk"
OPEN_PDKS_DIR = f"{TMP_DIR}/open_pdks"
SOURCES_PDK_DIR = f"{OPEN_PDKS_DIR}/sources"
SKYWATER_PDK_DIR = f"{SOURCES_PDK_DIR}/skywater-pdk"

INSTALLER_FILE = f"{PREFIX}/bin/run_open-pdks_installer.sh"
UNINSTALLER_FILE = f"{PREFIX}/bin/uninstall_open-pdks.sh"

DESCRIPTION = f"This application installs Open-PDKs version {VERSION_NO}"

# SKY130_HELP = f"Enable/disable installation of Google/SkyWater 130um PDK ()"
# SKY130_IS_ENABLED = "SKY130_IS_ENABLED"
# parser.add_argument('--enable-sky130', help=SKY130_HELP, dest=SKY130_IS_ENABLED, action='store_true', default=True)
# parser.add_argument('--disable-sky130', help=SKY130_HELP, dest=SKY130_IS_ENABLED, action='store_false', default=True)


# GF180_HELP = f"Enable/disable installation of Google/GlobalFoundries 180uM PDK ()"
# GF180_IS_ENABLED = "GF180_IS_ENABLED"
# parser.add_argument('--enable-gf180', help=GF180_HELP, dest=GF180_IS_ENABLED, action='store_true', default=True)
# parser.add_argument('--disable-gf180', help=GF180_HELP, dest=GF180_IS_ENABLED, action='store_false', default=True)


ARGS = sys.argv[3:]

print(f"Temporary directory is: {TMP_DIR}")

if (('-h' in ARGS) or ('--help' in ARGS)):
  print(
  f"""
  'configure' configures open_pdks {VERSION_NO} to adapt to many kinds of systems.

Usage: ./configure [OPTION]... [VAR=VALUE]...

To assign environment variables (e.g., CC, CFLAGS...), specify them as
VAR=VALUE.  See below for descriptions of some of the useful variables.

Defaults for the options are specified in brackets.

Configuration:
  -h, --help              display this help and exit
      --help=short        display options specific to this package
      --help=recursive    display the short help of all the included packages
  -V, --version           display version information and exit
  -q, --quiet, --silent   do not print `checking ...' messages
      --cache-file=FILE   cache test results in FILE [disabled]
  -C, --config-cache      alias for `--cache-file=config.cache'
  -n, --no-create         do not create output files
      --srcdir=DIR        find the sources in DIR [configure dir or `..']

Installation directories:
  --prefix=PREFIX         install architecture-independent files in PREFIX
                          [/usr/local]
  --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
                          [PREFIX]

By default, `make install' will install all the files in
`/usr/local/bin', `/usr/local/lib' etc.  You can specify
an installation prefix other than `/usr/local' using `--prefix',
for instance `--prefix=$HOME'.

For better control, use the options below.

Fine tuning of the installation directories:
  --bindir=DIR            user executables [EPREFIX/bin]
  --sbindir=DIR           system admin executables [EPREFIX/sbin]
  --libexecdir=DIR        program executables [EPREFIX/libexec]
  --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
  --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
  --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
  --runstatedir=DIR       modifiable per-process data [LOCALSTATEDIR/run]
  --libdir=DIR            object code libraries [EPREFIX/lib]
  --includedir=DIR        C header files [PREFIX/include]
  --oldincludedir=DIR     C header files for non-gcc [/usr/include]
  --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]
  --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
  --infodir=DIR           info documentation [DATAROOTDIR/info]
  --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
  --mandir=DIR            man documentation [DATAROOTDIR/man]
  --docdir=DIR            documentation root [DATAROOTDIR/doc/open_pdks]
  --htmldir=DIR           html documentation [DOCDIR]
  --dvidir=DIR            dvi documentation [DOCDIR]
  --pdfdir=DIR            pdf documentation [DOCDIR]
  --psdir=DIR             ps documentation [DOCDIR]

Optional Features:
  --disable-option-checking  ignore unrecognized --enable/--with options
  --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
  --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
  --enable-gf180mcu-pdk=[/path/to/gf180mcu/] --disable-gf180mcu-pdk
                          "location of the source files for the gf180mcu (pdks
                          with a pdk_url file can automatically download them
                          if the path is omitted)"
  --enable-klayout
                Enable or disable klayout setup [default=enabled]


  --enable-magic
                Enable or disable magic setup [default=enabled]


  --enable-netgen
                Enable or disable netgen setup [default=enabled]


  --enable-irsim
                Enable or disable irsim setup [default=enabled]


  --enable-openlane
                Enable or disable openlane setup [default=enabled]


  --enable-qflow
                Enable or disable qflow setup [default=enabled]


  --enable-xschem
                Enable or disable xschem setup [default=enabled]


  --enable-alpha-sky130[=path]
                          Install sky130_ml_xx_hd. If path is omitted, the repository
                          will be downloaded. [default=enabled]
  --enable-xschem-sky130[=path]
                          Install xschem_sky130. If path is omitted, the repository
                          will be downloaded. [default=enabled]
  --enable-klayout-sky130[=path]
                          Install klayout_sky130. If path is omitted, the repository
                          will be downloaded. [default=enabled]
  --enable-precheck-sky130[=path]
                          Install precheck_sky130. If path is omitted, the repository
                          will be downloaded. [default=enabled]
  --enable-sram-sky130[=path]
                          Install sky130_sram_macros. If path is omitted, the repository
                          will be downloaded. [default=disabled]
  --enable-osu-t12-sky130[=path]
                          Install sky130_osu_t12. If path is omitted, the repository
                          will be downloaded. [default=disabled]
  --enable-osu-t15-sky130[=path]
                          Install sky130_osu_t15. If path is omitted, the repository
                          will be downloaded. [default=disabled]
  --enable-osu-t18-sky130[=path]
                          Install sky130_osu_t18. If path is omitted, the repository
                          will be downloaded. [default=disabled]
  --enable-primitive-gf180mcu[=path]
                          Install gf180mcu_fd_pr. If path is omitted, the repository
                          will be downloaded. [default=enabled]
  --enable-io-gf180mcu[=path]
                          Install gf180mcu_fd_io. If path is omitted, the repository
                          will be downloaded. [default=enabled]
  --enable-sc-7t5v0-gf180mcu[=path]
                          Install gf180mcu_fd_sc_mcu7t5v0. If path is omitted, the repository
                          will be downloaded. [default=enabled]
  --enable-sc-9t5v0-gf180mcu[=path]
                          Install gf180mcu_fd_sc_mcu9t5v0. If path is omitted, the repository
                          will be downloaded. [default=enabled]
  --enable-sram-gf180mcu[=path]
                          Install gf180mcu_fd_ip_sram. If path is omitted, the repository
                          will be downloaded. [default=enabled]

Optional Packages:
  --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
  --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
  --with-gf180mcu-link-targets=none|source
                          "make symbolic links to existing files
                          [default=none]"
  --with-gf180mcu-variants=all|A|B|...
                          "compile/install specified PDK variants only
                          [default=all]"
  --with-ef-style         Use efabless style file system structure
                          [default=no]

Some influential environment variables:
  PYTHON      the Python interpreter

Use these variables to override the choices made by `configure' or to help
it to find libraries and programs with nonstandard names/locations.

Report bugs to <github.com/RTimothyEdwards/open_pdks>.
"""
)
  with open(INSTALLER_FILE, 'w') as ifile:
    ifile.write("#!/usr/bin/env bash\n")
    ifile.write("")
else:
  with open(INSTALLER_FILE, 'w') as ifile:
    ifile.write("CURRENT_DIR=${PWD}\n")
    ifile.write(f"\n")
    
    # Make final directories
    # ifile.write(f"mkdir {TMP_DIR}\n")

    # Create and clone Open_PDK repo
    ifile.write(f"#Clone Open PDK v{VERSION_NO} repository\n")
    ifile.write(f"mkdir {TMP_DIR}\n")
    ifile.write(f"cd {TMP_DIR}\n")
    ifile.write("git clone --depth 1 --branch 1.0.340 git://opencircuitdesign.com/open_pdks\n")
    ifile.write(f"\n")
    
    # Clone Skywater DPK repo & make timing
    ifile.write(f"cd {OPEN_PDKS_DIR}\n")
    ifile.write("#Clone Skywater PDK repository\n")
    ifile.write(f"mkdir {SOURCES_PDK_DIR}\n")
    ifile.write(f"cd {SOURCES_PDK_DIR}\n")
    
    ifile.write("git clone https://github.com/google/skywater-pdk\n")
    ifile.write(f"cd {SKYWATER_PDK_DIR}\n")
    
    # Get '$(CONDA_SETUP_HACK): $(RM) $(CONDA_DIR)/.condarc' 
    # into sources/skywater-pdk/third_party/make-env/conda.mk at line 120 
    # and '$(CONDA_ENV_PYTHON): $(ENVIRONMENT_FILE) $(REQUIREMENTS_FILE) | $(CONDA_PYTHON) $(CONDA_SETUP_PATCH) $(CONDA_PKGS_DEP) \
    # $(CONDA_ENVS_DIR) $(CONDA_PYVENV)' into sources/skywater-pdk/third_party/make-env/conda.mk at line 144
    ifile.write(f"sed -i '' -e '30s,.*,\twget https://github.com/IOmotade/homebrew-ocdtap/raw/master/Patches/open-pdks%401.0.340/condarc-yaml-error-patch.py,g' Makefile\n")
    ifile.write(f"sed -i '' -e '31s,.*,\tpython3 condarc-yaml-error-patch.py {OPEN_PDKS_DIR},g' Makefile\n")
    ifile.write(f"sed -i '' -e '32s,.*,-include $(TOP_DIR)/third_party/make-env/conda.mk,g' Makefile\n")
    
    ifile.write("git config http.postbuffer 524288000\n")
    # ifile.write("git submodule update --init libraries/sky130_fd_io/latest\n")
    # ifile.write("git submodule update --init libraries/sky130_fd_pr/latest\n")
    # ifile.write("git submodule update --init libraries/sky130_fd_sc_hd/latest\n")
    # ifile.write("git submodule update --init libraries/sky130_fd_sc_hvl/latest\n")
    
    # ifile.write("git submodule update --init libraries/sky130_fd_pr_reram/latest\n")
    # ifile.write("git submodule update --init libraries/sky130_fd_sc_hdll/latest\n")
    # ifile.write("git submodule update --init libraries/sky130_fd_sc_hs/latest\n")
    # ifile.write("git submodule update --init libraries/sky130_fd_sc_ms/latest\n")
    # ifile.write("git submodule update --init libraries/sky130_fd_sc_ls/latest\n")
    # ifile.write("git submodule update --init libraries/sky130_fd_sc_lp/latest\n")
    ifile.write("SUBMODULE_VERSION=latest make submodules -j3 || make submodules -j1\n")
    ifile.write("make timing\n")
    ifile.write(f"\n")
    
    # Make Open PDK
    ifile.write(f"cd {OPEN_PDKS_DIR}\n")
    
    args = ''.join([f'{arg} ' for arg in ARGS])
    ifile.write(f"./configure --prefix={PREFIX} --enable-sky130-pdk={SKYWATER_PDK_DIR} {args}\n")
    ifile.write(f"sed -i '' -e 's,prefix = .*,prefix = {TMP_DIR},g' Makefile\n")
    ifile.write("sed -i '' -e '77s,SED = .*,SED = /opt/homebrew/bin/gsed,g' gf180mcu/Makefile\n")
    ifile.write("sed -i '' -e '150s,SED = .*,SED = /opt/homebrew/bin/gsed,g' sky130/Makefile\n")
    
    ifile.write("make\n")
    ifile.write("make install\n")
    ifile.write(f"\n")
    
    ifile.write(f"cd {PREFIX}\n")
    ifile.write(f"rm -rf {TMP_DIR}\n")
    ifile.write(f"\n")
    
    ifile.write("cd $CURRENT_DIR\n")
    ifile.write("Done!\n")

  # with open(UNINSTALLER_FILE, 'w') as unfile:
  #   unfile.write(f"rm -rf {TMP_DIR}")
