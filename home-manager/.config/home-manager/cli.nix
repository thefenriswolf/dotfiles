{ config, lib, pkgs, ... }: {

  programs.btop.enable = true;
  programs.yt-dlp.enable = true;

  home.packages = [
    # zfs
    #pkgs.sanoid
    #pkgs.httm

    # document tools
    pkgs.pandoc
    pkgs.diff-pdf

  ];
}
