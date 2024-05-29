{ config, lib, pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.jetbrains-mono
    pkgs.fira-code
    pkgs.noto-fonts-emoji
    pkgs.nerdfonts
    pkgs.corefonts
    pkgs.vistafonts
    pkgs.jetbrains-mono
    pkgs.nerd-font-patcher
  ];
}
