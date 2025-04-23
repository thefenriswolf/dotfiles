{ pkgs, ... }:
let
  pname = "Lychee";
  version = "7.3.2";
  src = pkgs.fetchurl {
    url =
      "https://mango-lychee.nyc3.cdn.digitaloceanspaces.com/LycheeSlicer-${version}.AppImage";
    hash = "sha256-CmN4Q4gTGYeICIoLz0UuVlSyOstXW/yYVb4s1dT5EOc=";
  };
in pkgs.appimageTools.wrapType2 {
  inherit pname version src;
  extraPkgs = pkgs: [ ];

  desktopItems = [
    (pkgs.makeDesktopItem {
      name = "Lychee Slicer";
      exec = "Lychee";
      #icon = "drawio";
      desktopName = "Lychee Slicer";
      categories = [ "Graphics" ];
    })
  ];
}

