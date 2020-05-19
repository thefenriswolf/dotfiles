# TODO: add to pkgs/top-level/all-packages.nix above "copyq" ->
# contour = libsForQt5.callPackage ../applications/misc/contour { };
# TODO: remove all comments before submitting to nixpkgs tree

{ stdenv, mkDerivation, lib, fetchFromGitHub, pkgconfig, cmake, ninja
, extra-cmake-modules, libsForQt5, wrapQtAppsHook, qt5, qtbase, kwindowsystem
, freetype, fontconfig, harfbuzz, pcre-cpp, libGL, glfw, glew, glm, boost, tbb
}:

mkDerivation rec {
  pname = "contour";
  version = "alpha-20200418"; # TODO: replace with actual version on first release

  src = fetchFromGitHub {
    owner = "christianparpart";
    repo = "contour";
    rev = "857a3fdcfab316c9f521709faad877c06ea0330a"; # TODO: replace with actual version on first release
    sha256 = "04d9v4qwv35nf97bibw1xqjr7cr8fnp4p0n0qg6lhdsrxpmqrm57";
    fetchSubmodules = true;
  };

  nativeBuildInputs =
    [ pkgconfig cmake extra-cmake-modules ninja wrapQtAppsHook ];

  buildInputs = [
    freetype
    glfw
    qtbase
    pcre-cpp
    tbb
    boost
    glm
    glew
    libsForQt5.kwindowsystem
    libGL
  ];

  preConfigure = ''
    sed -i 's/-DLIBTERMINAL_EXECUTION_PAR="OFF"/-DLIBTERMINAL_EXECUTION_PAR="ON"/g' autogen.sh
  '';

  configureScript = ''
    ./autogen.sh
  '';

  meta = with stdenv.lib; {
    description = "Modern C++ Terminal Emulator";
    homepage = "https://github.com/christianparpart/contour";
    license = licenses.asl20;
    maintainers = with maintainers; [ thefenriswolf ];
    platforms =
      [ "x86_64-linux" "x86_64-darwin" "x86_64-freebsd" "x86_64-openbsd" ]; # TODO: check if contour build on those platforms
  };
}
