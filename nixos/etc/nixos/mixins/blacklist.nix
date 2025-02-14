{ config, lib, pkgs, ... }:

{
  boot.blacklistedKernelModules = lib.mkDefault [
    "nouveau"
    "nvidia"
    "nvidia_drm"
    "nvidia_modeset"
    "k10temp"
  ];
  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [
      discover
      kwallet
      kwalletmanager
    ];
    xfce.excludePackages = [ ];
    gnome.excludePackages = [ ];
  };
}
