{ pkgs, ... }:
let
  pname = "Lychee";
  version = "7.5.5";
  src = pkgs.fetchurl {
    url = "https://mango-lychee.nyc3.cdn.digitaloceanspaces.com/LycheeSlicer-${version}.AppImage";
    hash = "sha256-coPzvcF+kQVkETiKc3AY9tuPvh4vm45LSXi5UCbL9GI=";
  };
in
pkgs.appimageTools.wrapType2 {
  inherit pname version src;
  extraPkgs = pkgs: [ pkgs.xorg.libxshmfence ];
  extraLibraries = pkgs: [ pkgs.xorg.libxshmfence ];

  desktopItems = [
    (pkgs.makeDesktopItem {
      name = "Lychee Slicer";
      desktopName = "Lychee Slicer";
      genericName = "Slicer";
      comment = "Lychee 3D Resin and FDM Slicer";
      exec = "Lychee %U";
      terminal = false;
      categories = [
        "Graphics"
        "Office"
      ];
      mimeTypes = [
        "model/stl"
        "application/x-bgcode"
      ];
    })
  ];
}
