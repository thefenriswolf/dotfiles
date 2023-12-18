{ config, lib, pkgs, ... }: {

  programs.btop.enable = true;
  programs.yt-dlp.enable = true;

  home.packages = [
    # zfs
    #pkgs.sanoid

    # btrfs
    pkgs.httm

    # document tools
    pkgs.pandoc
    pkgs.diff-pdf

    # QoL
    pkgs.calcurse
    pkgs.ledger
    pkgs.hledger
    pkgs.reckon

    # google drive
    pkgs.google-drive-ocamlfuse

    # file management
    pkgs.yazi
  ];
}
