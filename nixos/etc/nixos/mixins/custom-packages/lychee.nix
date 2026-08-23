{ pkgs, ... }:
let
  pname = "lycheeslicer";
  version = "7.6.6";
  src = pkgs.fetchurl {
    url = "https://mango-lychee.nyc3.cdn.digitaloceanspaces.com/LycheeSlicer-${version}.AppImage";
    hash = "sha256-eDMhA8fCD++BYK58t4/2XUlzrhcwtbAuOzRsThQAiVs=";
  };
  appimageContents = pkgs.appimageTools.extractType1 { inherit pname version src; };
in
pkgs.appimageTools.wrapType2 {
  inherit pname version src;
  extraPkgs = pkgs: [
    pkgs.libxshmfence
    pkgs.autoPatchelfHook
    pkgs.asar
    pkgs.unzip
    (pkgs.buildPackages.wrapGAppsHook3.override { inherit (pkgs.buildPackages) makeWrapper; })
  ];
  extraLibraries = pkgs: [ pkgs.libxshmfence ];
  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace 'Exec=AppRun' 'Exec=${pname}'
    cp -r ${appimageContents}/usr/share/icons $out/share

    # ln -s $out/bin/${pname}-${version} $out/bin/${pname}
  '';
  extraBwrapArgs = [
    "--bind-try /etc/nixos/ /etc/nixos/"
  ];
  dieWithParent = false;
}
