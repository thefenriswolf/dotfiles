{ config, lib, pkgs, ... }:

{
  #########
  # BTRFS #
  #########
  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
  };
  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  environment = {
    systemPackages = with pkgs; [
      # drive health
      gsmartcontrol
      smartmontools

      # btrfs
      btrbk
      compsize
      btrfs-snap
      btrfs-heatmap

      # btrfs/zfs
      httm

      # zfs
      sanoid
    ];
  };
}
