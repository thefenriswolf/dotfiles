{ config, lib, pkgs, ... }:

{
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
      "rpool/home" = {
        recursive = true;
        autosnap = true;
        autoprune = true;
        use_template = [ "ignore" ];
      };
      "rpool/nix" = {
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

      # btrfs/zfs
      httm

      # zfs
      sanoid

      # network
      localsend
    ];
  };
}
