{ config, lib, pkgs, ... }:

{
  boot.blacklistedKernelModules = lib.mkDefault [
    "nouveau"
    "nvidia"
    "nvidia_drm"
    "nvidia_modeset"
    "k10temp"
  ];

}
