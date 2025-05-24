{ config, lib, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    obsidian
    localsend
    syncthing
    syncthingtray
  ];

  programs.localsend = {
    enable = true;
    openFirewall = true; # port 53317
  };

  programs.kdeconnect = {
    enable = false;
    #package = pkgs.kdePackages.kdeconnect-kde;
  };

  services = {
    syncthing = {
      enable = false;
      group = "syncthing";
      user = "syncthing";
      configDir = "/home/ro/playground/dotfiles/syncthing/";
    };
  };
}
