{ config, lib, pkgs, ... }:

{
  home.packages = [
    pkgs.jetbrains-mono
    pkgs.fira-code
    pkgs.noto-fonts-emoji
    pkgs.nerdfonts
  ];
}
