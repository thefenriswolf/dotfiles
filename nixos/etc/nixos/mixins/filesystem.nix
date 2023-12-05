{ config, lib, pkgs, ... }:

{
  services.btrfs.autoScrub.enable = true;
  services.fstrim.enable = true;
  services.fstrim.interval = "weekly";

  ###########
  # SNAPPER #
  ###########

  #  services.snapper.cleanupInterval = "1d";
  #  services.snapper.snapshotInterval = "hourly";
  #  services.snapper.configs = {
  #    home = {
  #      SUBVOLUME = "/home";
  #      FSTYPE = "btrfs";
  #      NUMBER_LIMIT = "12";
  #      ALLOW_USERS = [ "ro" ];
  #      TIMELINE_CREATE = true;
  #      TIMELINE_CLEANUP = true;
  #    };
  #  };

  ##############
  # btrfs-snap #
  ##############
  systemd.services.btrfs-autosnap = {
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
    path = with pkgs; [ btrfs-snap bash ];
    script = ''
      ${pkgs.btrfs-snap}/bin/btrfs-snap -c -r /home 1h 24
    '';
  };
  systemd.timers.btrfs-autosnap = {
    wantedBy = [ "timers.target" ];
    partOf = [ "btrfs-autosnap.service" ];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "45m";
      Unit = "btrfs-autosnap.service";
    };
  };

  environment = {
    systemPackages = with pkgs; [
      # btrfs
      btrbk
      compsize
      btrfs-snap
      btrfs-heatmap
      btrfs-assistant

      # btrfs/zfs
      httm

      # zfs
    ];
  };
}
