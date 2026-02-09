{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    rsync
    openvpn
    sniffnet
    nethogs
  ];

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [
        8501
        2222
      ];
      allowedUDPPorts = [
        8501
        2222
      ];
      #allowedUDPPortRanges = [{
      #  from = 1714;
      #  to = 1764;
      #}];
      #allowedTCPPortRanges = [{
      #  from = 1714;
      #  to = 1764;
      #}];
    };

    # useDHCP = true;
    networkmanager = {
      enable = true;
      wifi = {
        backend = "iwd";
        powersave = false;
      };
      dns = "systemd-resolved";
      insertNameservers = [
        "9.9.9.9"
        "194.242.2.2"
      ];
    };
    wireless.iwd.package = pkgs.iwd;
  };

  services.resolved = {
    enable = true;
    domains = [ "~." ];
    dnsovertls = "false";
    dnssec = "false";
    fallbackDns = [
      "116.202.176.26#noads.libredns.gr"
    ];
  };
  # Workaround https://github.com/NixOS/nixpkgs/issues/180175
  systemd.services.NetworkManager-wait-online.enable = false;
}
