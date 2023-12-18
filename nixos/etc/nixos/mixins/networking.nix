{ config, pkgs, ... }: {

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 53317 ];
      allowedUDPPorts = [ 53317 ];
    };

    hostName = "desktop-stefan";
    networkmanager = {
      enable = true;
      wifi = {
        backend = "iwd";
        powersave = false;
      };
    };
    wireless.iwd.package = pkgs.iwd;
  };
  # Workaround https://github.com/NixOS/nixpkgs/issues/180175
  systemd.services.NetworkManager-wait-online.enable = false;
}
