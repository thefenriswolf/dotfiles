{ pkgs,  ... }:

let
  pname = "UVtools";
  version = "5.1.7";
  src = pkgs.fetchurl {
    url =
      "https://github.com/sn4k3/${pname}/releases/download/v${version}/${pname}_linux-x64_v${version}.AppImage";
    hash = "sha256-f+I7tirJ/deZd5meFvIn/ZMWByYjI/87+a9H8dixILo=";
  };

  desktopItem = [
    (pkgs.makeDesktopItem {
      name = "UVtools";
      comment =
        "MSLA/DLP, file analysis, calibration, repair, conversion and manipulation  tool";
      desktopName = "UVtools";
      noDisplay = false;
      exec = "UVtools";
      terminal = false;
      mimeTypes = [ "model/stl" ];
      categories = [ "Graphics" ];
      keywords = [ "STL" "Slicer" "Printing" ];
    })
  ];

in pkgs.appimageTools.wrapType2 {
  inherit pname version src;

  #extraInstallCommands = ''install -Dm444 -t $out/share/applications ${desktopItem}/share/applications/*'';

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

