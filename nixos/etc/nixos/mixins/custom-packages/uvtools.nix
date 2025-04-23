{ pkgs, ... }:
let
  pname = "UVtools";
  version = "5.1.0";
  src = pkgs.fetchurl {
    url =
      "https://github.com/sn4k3/${pname}/releases/download/v${version}/${pname}_linux-x64_v${version}.AppImage";
    hash = "sha256-ZpO/sRRBihn70GadqzGquPqC0aFRxs8v4Fz4BcoIuIA=";
  };
in pkgs.appimageTools.wrapType2 {
  inherit pname version src;
  extraPkgs = pkgs: [ pkgs.icu ];

  desktopItems = [
    (pkgs.makeDesktopItem {
      name = "UVtools";
      exec = "UVtools %U";
      #icon = "drawio";
      desktopName = "UVtools";
      comment = "UVtools";
      categories = [ "Graphics" ];
    })
  ];
}

