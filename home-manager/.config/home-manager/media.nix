{ config, lib, pkgs, ... }:

{
  programs.mpv = { enable = true; };
  home.packages = with pkgs; [
    drawing
    pinta
    kdePackages.kolourpaint
    krita
    cmus
    vlc
    mediainfo
    spotube
    nyxt

    vscode-fhs
  ];
}
