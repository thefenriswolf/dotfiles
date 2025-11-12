{
  config,
  lib,
  pkgs,
  ...
}:
{

  services.immich = {
    enable = true;
    machine-learning.enable = false;
    openFirewall = true;
    port = 2283;
    #host = "localhost";
    group = "immich";
    settings.newVersionCheck.enabled = false;
    database = {
      enable = true;
      createDB = true;
      user = "immich";
      name = "immich";
      #port = 5432;
    };
  };
  users.users.immich.extraGroups = [
    "video"
    "render"
  ];
}
