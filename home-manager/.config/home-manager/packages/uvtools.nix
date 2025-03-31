with import <nixpkgs> { };
let
  pname = "UVtools";
  version = "5.0.8";

  src = fetchurl {
    url =
      "https://github.com/sn4k3/${pname}/releases/download/v${version}/${pname}_linux-x64_v${version}.AppImage";
    hash = "sha256-yvbPQR1MOkOhC3Cr+py5p7mo+2nYps1uEHIodqIOy/M";
  };

in appimageTools.wrapType2 {
  inherit pname version src;
  extraPkgs = pkgs: [ pkgs.icu ];

  desktopItems = [
    (makeDesktopItem {
      name = "UVtools";
      exec = "UVtools %U";
      #icon = "drawio";
      desktopName = "UVtools";
      #comment = "draw.io desktop";
      #mimeTypes = [ "application/vnd.jgraph.mxfile" "application/vnd.visio" ];
      categories = [ "Graphics" ];
      startupWMClass = "UVtools";
    })
  ];
}

