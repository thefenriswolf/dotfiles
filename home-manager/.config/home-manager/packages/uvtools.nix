with import <nixpkgs> { };
let
  pname = "UVtools";
  version = "5.0.7";

  src = fetchurl {
    url =
      "https://github.com/sn4k3/${pname}/releases/download/v${version}/${pname}_linux-x64_v${version}.AppImage";
    hash = "sha256-dS+wKTl12s0SkbrDXICVYGeBt9bx1fz/HFfNFuZYIXg";
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

