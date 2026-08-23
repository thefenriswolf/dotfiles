{ pkgs, ... }:
let
  pname = "UVtools";
  version = "6.2.0";
  src = pkgs.fetchurl {
    url = "https://github.com/sn4k3/${pname}/releases/download/v${version}/${pname}_linux-x64_v${version}.AppImage";
    hash = "sha256-LXtBGn4C0GiRzvR0U7EVnJp4peIfw/4xUVyXTmvQG3g=";
  };
  appimageContents = pkgs.appimageTools.extractType1 { inherit pname version src; };
in
pkgs.appimageTools.wrapType2 {
  inherit pname version src;
  extraPkgs = pkgs: [
    pkgs.autoPatchelfHook
    pkgs.asar
    pkgs.unzip
    pkgs.libxshmfence
    pkgs.icu
    pkgs.at-spi2-core
    pkgs.libgdiplus
    pkgs.openexr
    pkgs.libgeotiff
    (pkgs.buildPackages.wrapGAppsHook3.override { inherit (pkgs.buildPackages) makeWrapper; })
  ];
  extraLibraries = pkgs: [ pkgs.libxshmfence ];
  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/pt.ptrtech.${pname}.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/pt.ptrtech.${pname}.desktop \
      --replace 'Exec=AppRun' 'Exec=${pname}'
    cp -r ${appimageContents}/usr/share/icons $out/share

    # ln -s $out/bin/${pname}-${version} $out/bin/${pname}
  '';
  extraBwrapArgs = [
    "--bind-try /etc/nixos/ /etc/nixos/"
  ];
  dieWithParent = false;
}
