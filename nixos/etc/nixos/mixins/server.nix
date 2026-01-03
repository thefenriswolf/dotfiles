{
  config,
  lib,
  pkgs,
  ...
}:
{

  services.immich = {
    enable = true;
    machine-learning.enable = true;
    accelerationDevices = [ "/dev/dri/renderD128" ];
    openFirewall = true;
    host = "0.0.0.0";
    mediaLocation = "/var/lib/immich";
  };
  users.users.immich.extraGroups = [
    "video"
    "render"
  ];
}
