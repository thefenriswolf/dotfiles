{ config, lib, pkgs, ... }:

{
  #######
  # ZFS #
  #######

  services.zfs.autoScrub = {
    enable = false;
    interval = "monthly";
    pools = [ ]; # scrub all
    randomizedDelaySec = "1h";
  };

  services.zfs.trim = {
    enable = true;
    interval = "weekly";
  };

  services.sanoid = {
    enable = true;
    interval = "hourly";
    templates = {
      ignore = {
        # daily = 0;
        # weekly = 0;
        # monthly = 0;
        # yearly = 0;
        "autoprune" = false;
        "autosnap" = false;
        "monitor" = false;
      };
      crucial = {
        daily = 48;
        weekly = 14;
        monthly = 60;
        yearly = 24;
        "autoprune" = true;
        "autosnap" = true;
        "monitor" = true;
      };
      lazy = {
        daily = 12;
        weekly = 5;
        monthly = 15;
        yearly = 6;
        "autoprune" = true;
        "autosnap" = true;
        "monitor" = true;
      };
      comatose = {
        daily = 4;
        weekly = 4;
        monthly = 4;
        yearly = 4;
        "autoprune" = true;
        "autosnap" = true;
        "monitor" = true;
      };

    };
    ####################### datasets
    # HOME
    datasets = {
      "rpool/home" = {
        recursive = true;
        autosnap = true;
        autoprune = true;
        use_template = [ "crucial" ];
      };
      # SYSTEM
      "rpool/root" = { use_template = [ "comatose" ]; };
      "rpool/nix" = { use_template = [ "ignore" ]; };
      "rpool/var" = {
        recursive = true;
        autosnap = false;
        autoprune = true;
        processChildrenOnly = false;
        use_template = [ "ignore" ];
      };
      # EXTRA
      "zpool/playground" = {
        recursive = true;
        autosnap = true;
        autoprune = true;
        processChildrenOnly = false;
        use_template = [ "lazy" ];
      };
      "zpool/storage" = {
        recursive = true;
        autosnap = true;
        autoprune = true;
        processChildrenOnly = false;
        use_template = [ "lazy" ];
      };
      "dpool/data" = {
        recursive = true;
        autosnap = true;
        autoprune = true;
        processChildrenOnly = false;
        use_template = [ "lazy" ];
      };
    };
    extraArgs = [ "--verbose" "--debug" " >> /tmp/sanoid.log" ];
  };

  environment = {
    systemPackages = with pkgs; [
      # drive health
      gsmartcontrol
      smartmontools

      # btrfs/zfs
      httm

      # zfs
      sanoid
    ];
  };
}
