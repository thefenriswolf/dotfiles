{ config, lib, pkgs, ... }:

{
  #######
  # ZFS #
  #######

  services.zfs.autoScrub = {
    enable = true;
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
    };
    datasets = {
      "rpool/home" = {
        recursive = true;
        autosnap = true;
        autoprune = true;
        use_template = [ "crucial" ];
      };
      "rpool/nix" = {
        # recursive = true;
        # autosnap = true;
        # autoprune = true;
        # processChildrenOnly = false;
        use_template = [ "ignore" ];
      };
      "rpool/var" = {
        recursive = true;
        autosnap = false;
        autoprune = true;
        processChildrenOnly = false;
        use_template = [ "ignore" ];
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
