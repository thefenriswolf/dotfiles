{ pkgs, ... }:

let
  pname = "UVtools";
  version = "5.2.1";
  src = pkgs.fetchurl {
    url = "https://github.com/sn4k3/${pname}/releases/download/v${version}/${pname}_linux-x64_v${version}.AppImage";
    hash = "sha256-LfeC8JamgayrGCitPYCxII2HXJ9FXIWRiNdE6cw6JjM=";
  };

  desktopItem = [
    (pkgs.makeDesktopItem {
      name = "UVtools";
      comment = "MSLA/DLP, file analysis, calibration, repair, conversion and manipulation  tool";
      desktopName = "UVtools";
      exec = "UVtools %U";
      terminal = false;
      mimeTypes = [
        "model/stl"
        "application/x-bgcode"
      ];
      categories = [ "Graphics" ];
      keywords = [
        "STL"
        "Slicer"
        "Printing"
      ];
    })
  ];

in
pkgs.appimageTools.wrapType2 {
  inherit pname version src;

  extraLibraries = pkgs: [ pkgs.icu ];

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
