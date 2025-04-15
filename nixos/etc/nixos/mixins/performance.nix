{ config, lib, pkgs, ... }:

{
  programs.bcc.enable = true;

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
