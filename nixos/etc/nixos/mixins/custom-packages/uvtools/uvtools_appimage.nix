{ pkgs, ... }:

let
  pname = "UVtools";
  version = "5.2.1";
  src = pkgs.fetchurl {
    url = "https://github.com/sn4k3/${pname}/releases/download/v${version}/${pname}_linux-x64_v${version}.AppImage";
    hash = "sha256-LfeC8JamgayrGCitPYCxII2HXJ9FXIWRiNdE6cw6JjM=";
  };
in
pkgs.appimageTools.wrapType2 {
  inherit pname version src;
  extraPkgs = pkgs: [
    pkgs.xorg.libxshmfence
    pkgs.icu
    pkgs.at-spi2-core
    pkgs.libgdiplus
    pkgs.openexr
    pkgs.libgeotiff
  ];

  # meta = {
  # description =
  #    "MSLA/DLP, file analysis, calibration, repair, conversion and manipulation";
  # homepage = "https://github.com/sn4k3/UVtools";
  # license = lib.agpl3Only;
  #  maintainers = with lib.maintainers; [ thefenriswolf ];
  #  platforms = [ "x86_64-linux" ];
  # mainProgram = "UVtools";
  #};
}
