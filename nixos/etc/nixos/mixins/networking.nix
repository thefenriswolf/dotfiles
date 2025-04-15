{ config, pkgs, ... }: {

  environment.systemPackages = with pkgs; [ rsync openvpn ];

  networking = {
    firewall = {
      enable = true;
      #allowedTCPPorts = [ 2283 ];
      #allowedUDPPorts = [ 2283 ];
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
      insertNameservers = [ "1.1.1.2" "8.8.8.8" ];
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
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
    ];
  };
  # Workaround https://github.com/NixOS/nixpkgs/issues/180175
  systemd.services.NetworkManager-wait-online.enable = false;
}
