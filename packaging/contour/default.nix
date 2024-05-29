# after cool-retro-term
# contour = libsForQt5.callPackage ../applications/misc/contour { };

#{ stdenv, fetchFromGitHub, mkDerivation, qt5, qtbase, cmake, extra-cmake-modules
#, libGL, fontconfig, freetype, harfbuzz, tbb, pcre-cpp, pkgconfig, boost
#, kwindowsystem, fmt, catch2 }:

with import <nixpkgs> { };

stdenv.mkDerivation rec {
  version = "19122020";
  pname = "contour";

  src = fetchFromGitHub {
    owner = "christianparpart";
    repo = "contour";
    fetchSubmodules = true;
    rev = "v0.1.1";
    sha256 = "1lnhjs58b9iqjq5l4vx9xzlsvn5dmsv73q3935f32njrpqrpxfrz";
  };

  buildInputs = [
    qt5.qtbase
    libsForQt5.kwindowsystem
    harfbuzz
    freetype
    tbb
    pcre-cpp
    boost
    fontconfig
    libGL
    fmt
    catch2
    libyamlcpp
  ];

  nativeBuildInputs = [ cmake extra-cmake-modules ninja pkgconfig ];

  dontWrapQtApps = true;

  #  cmakeFlags = [
  #    "-DCONTOUR_BLUR_PLATFORM_KWIN=ON"
  #    "-DCONTOUR_COVERAGE=OFF"
  #    "-DCONTOUR_PERF_STATS=OFF"
  #    "-DLIBTERMINAL_EXECUTION_PAR=ON"
  #    "-DLIBTERMINAL_LOG_TRACE=ON"
  #    "-DLIBTERMINAL_LOG_RAW=ON"
  #    "-DOpenGL_GL_PREFERENCE=LEGACY"
  #    "-DYAML_CPP_BUILD_TOOLS=OFF"
  #    "-DYAML_CPP_BUILD_CONTRIB=OFF"
  #    "-DBUILD_SHARED_LIBS=ON"
  #    "-DYAML_CPP_BUILD_TESTS=OFF"
  #    "-DCMAKE_BUILD_TYPE=Debug"
  #  ];

  # installFlags = [ "INSTALL_ROOT=$(out)" ];

  #  hardeningEnable = [ "pie" "fortify" ];

  enableParallelBuilding = true;

  meta = with lib; {
    description = "Modern C++ Terminal Emulator";
    longDescription = ''
      contour is a modern terminal emulator, for everyday use. 
      It is fully seperating emulation from graphical representation for clear seperation of concerns
      but also for special features to come before version 1.0 is released
      (headless terminal server with GUI & TUI frontends).
    '';
    homepage = "https://github.com/christianparpart/contour";
    license = licenses.asl20;
    platforms = with platforms; unix;
    maintainers = with maintainers; [ thefenriswolf ];
  };
}
