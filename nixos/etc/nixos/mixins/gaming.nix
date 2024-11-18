{ config, lib, pkgs, ... }:

{
  programs.gamemode = {
    enable = true;
    settings.general.inhibit_screensaver = 0;
  };
  fonts.fontconfig.cache32Bit = true;
  programs.steam = {
    enable = true;
    extest.enable = true;
    localNetworkGameTransfers.openFirewall = true;
    remotePlay.openFirewall = false;
    gamescopeSession.enable = false;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
    extraPackages = with pkgs; [ gamescope ];
  };
  hardware.steam-hardware.enable = true;

  environment.systemPackages = with pkgs; [
    # support both 32- and 64-bit applications
    wine64
    wine-wayland
    winePackages.wayland
    winetricks
    mangohud
  ];
}
