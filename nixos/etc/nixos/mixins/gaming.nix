{ config, lib, pkgs, ... }:

{
  fonts.fontconfig.cache32Bit = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = false;
    gamescopeSession.enable = false;
  };
  hardware.steam-hardware.enable = true;

  environment.systemPackages = with pkgs; [
    # support both 32- and 64-bit applications
    wineWowPackages.staging
    wineWowPackages.waylandFull
    winetricks
    mangohud
  ];
}
