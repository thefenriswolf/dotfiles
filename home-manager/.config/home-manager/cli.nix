{ config, lib, pkgs, ... }: {

  programs.btop.enable = true;
  programs.yt-dlp.enable = true;

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
  };

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
    pkgs.fastfetch
    pkgs.ledger
    pkgs.hledger
    pkgs.reckon
    pkgs.inotify-tools
    pkgs.lorri

    # google drive
    pkgs.google-drive-ocamlfuse

    # file management
    #pkgs.yazi
    pkgs.ueberzugpp
  ];
}
