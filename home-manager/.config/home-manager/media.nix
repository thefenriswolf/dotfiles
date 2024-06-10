{ config, lib, pkgs, ... }:

{
  programs.mpv = { enable = true; };
  home.packages = with pkgs; [ cmus vlc mediainfo spotube ];
}
