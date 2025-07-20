{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ systeroid ];

  programs.bcc.enable = true;
  services.sysprof.enable = true;

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 30;
  };

  systemd.extraConfig = ''
    DefaultTimeoutStartSec=30s
    DefaultTimeoutStopSec=30s
  '';
}
