{ config, lib, pkgs, ... }:

{
  services.lvm.enable = false;
  boot.initrd.services.lvm.enable = false;

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
    gnome.excludePackages = with pkgs; [
      geary
      epiphany
      gnome-music
      gnome-tour
      totem
      gnome-text-editor
    ];
  };
}
