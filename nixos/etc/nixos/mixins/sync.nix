{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ obsidian syncthing syncthingtray ];

  ##########
  # BROKEN #
  ##########
  services = {
    syncthing = {
      enable = false;
      systemService = false;
      dataDir = "/home/ro/org";
      configDir = "/home/ro/.config/syncthing";
      group = "syncthing";
      user = "syncthing";
      openDefaultPorts = true;
      extraFlags =
        [ "--no-default-folder" ]; # don't create "default" sync folder
      guiAddress = "127.0.0.1:8384";
      overrideDevices =
        true; # overrides any devices added or deleted through the WebUI
      overrideFolders =
        true; # overrides any folders added or deleted through the WebUI
      settings = {
        gui = { theme = "dark"; };
        options = {
          urAccepted = 1;
          databaseTuning = "auto";
          listenAddresses = "default";
          crashReportingEnabled = true;
        };
        devices = {
          "Stefan_iPhone" = {
            id = "";
            autoAcceptFolders = true;
          };
        };
        folders = {
          "notes" = { # Folder ID
            path = "/home/ro/org/obsidian";
            devices = [ "Stefan_iPhone" ];
            ignorePerms = true;
          };
        };
      };
    };
  };
}
