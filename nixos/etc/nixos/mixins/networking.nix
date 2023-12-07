{ config, pkgs, ... }: {
  networking = {
    firewall.enable = true;
    hostName = "thinkpad-stefan";
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

  programs.kdeconnect.enable = true;
  programs.kdeconnect.package = pkgs.plasma5Packages.kdeconnect-kde;
}
