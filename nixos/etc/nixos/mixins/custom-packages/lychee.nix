{ pkgs, ... }:
let
  pname = "Lychee";
  version = "7.4.2";
  src = pkgs.fetchurl {
    url =
      "https://mango-lychee.nyc3.cdn.digitaloceanspaces.com/LycheeSlicer-${version}.AppImage";
    hash = "sha256-RTLlNB6eiesXZayC69hpnXQsAgmPuaJTC+18Q6KzAP0=";
  };
in pkgs.appimageTools.wrapType2 {
  inherit pname version src;
  extraPkgs = pkgs: [ ];

  desktopItems = [
    (pkgs.makeDesktopItem {
      name = "Lychee Slicer";
      exec = "Lychee";
      desktopName = "Lychee Slicer";
      categories = [ "Graphics" ];
    })
  ];
}

