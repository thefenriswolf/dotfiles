# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

# lint: nix run github:astro/deadnix -- path/
# rebuild: sudo nixos-rebuild boot --flake '.#laptop-stefan' --impure
{ config, pkgs, ... }: {

  imports = [ ];

  programs.direnv.enable = true;
  programs.dconf.enable = true;
  services.dbus.enable = true;
  services.gvfs.enable = true;

  programs = {
    gnome-disks.enable = true;
    seahorse.enable = false;
  };

  users.users.ro = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "disk"
      "audio"
      "video"
      "networkmanager"
      "systemd-journal"
      "input"
      "docker"
      "lxd"
      "podman"
      "docker"
      "gamemode"
      "cups"
      "syncthing"
    ];
    packages = with pkgs; [ ];
  };
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}

