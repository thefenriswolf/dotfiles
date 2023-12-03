{ config, lib, pkgs, ... }:

{
  fonts.fontconfig.cache32Bit = true;
  programs.steam.enable = true;
  hardware.steam-hardware.enable = true;
}
