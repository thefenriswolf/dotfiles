{ config, pkgs, ... }:
{

  networking.hostName = "laptop-stefan";
  services.nix-serve = {
    enable = true;
    port = 5000;
    openFirewall = true;
  };
  # nix.settings.substituters = [ "http:192.168.1.112:5000" ];
}
