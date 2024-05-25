{ config, lib, pkgs, ... }:

{
  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
  };

  services.fstrim.enable = true;
  services.fstrim.interval = "weekly";

  #########
  # BTRBK #
  #########
  services.btrbk.instances."btrbk" = {
    onCalendar = "*:0/10";
    settings = {
      snapshot_preserve_min = "2d";
      volume."/" = {
        subvolume = "home";
        snapshot_dir = "/home/.snapshots";
      };
    };
  };

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
  # systemd.services.btrfs-autosnap = {
  #   serviceConfig = {
  #     Type = "oneshot";
  #     User = "root";
  #   };
  #   path = with pkgs; [ btrfs-snap bash ];
  #   script = ''
  #     ${pkgs.btrfs-snap}/bin/btrfs-snap -c -r /home 1h 24
  #   '';
  # };
  # systemd.timers.btrfs-autosnap = {
  #   wantedBy = [ "timers.target" ];
  #   partOf = [ "btrfs-autosnap.service" ];
  #   timerConfig = {
  #     OnBootSec = "5m";
  #     OnUnitActiveSec = "45m";
  #     Unit = "btrfs-autosnap.service";
  #   };
  # };

  # ZFS
  services.sanoid = {
    enable = false;
    interval = "hourly";
    templates = {
      crucial = { daily = 48; };
      lazy = { daily = 0; };
      intermediate = { daily = 12; };
    };
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

      # network
      localsend
    ];
  };
}
