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

  # BTRBK #
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
  #######
  # ZFS #
  #######
  services.sanoid = {
    enable = false;
    interval = "hourly";
    templates = {
      ignore = {
        daily = 0;
        weekly = 0;
        monthly = 0;
        yearly = 0;
        "autoprune" = true;
        "autosnap" = false;
        "monitor" = false;
      };
    };
    datasets = {
      "rpool/ROOT" = {
        recursive = true;
        autosnap = true;
        autoprune = true;
        use_template = [ "ignore" ];
      };
      "dpool/study" = {
        recursive = true;
        autosnap = true;
        autoprune = true;
        processChildrenOnly = true;
        use_template = [ "ignore" ];
      };
    };
    extraArgs = [ "--verbose" ];
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
