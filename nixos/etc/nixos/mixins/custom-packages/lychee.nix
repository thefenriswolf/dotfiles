{ pkgs, ... }:
let
  pname = "Lychee";
  version = "7.4.4";
  src = pkgs.fetchurl {
    url =
      "https://mango-lychee.nyc3.cdn.digitaloceanspaces.com/LycheeSlicer-${version}.AppImage";
    hash = "sha256-ZbKMCbTKqdjcTefEfrhovRQSRydKf3QBsXHi/XwXuUc=";
  };
in pkgs.appimageTools.wrapType2 {
  inherit pname version src;
  extraPkgs = pkgs: [ pkgs.xorg.libxshmfence ];
  extraLibraries = pkgs: [ pkgs.xorg.libxshmfence ];

  desktopItems = [
    (pkgs.makeDesktopItem {
      name = "Lychee Slicer";
      exec = "Lychee";
      desktopName = "Lychee Slicer";
      categories = [ "Graphics" ];
    })
  ];
}

