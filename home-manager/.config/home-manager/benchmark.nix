{ config, lib, pkgs, ... }:

{
  home.packages = [
    # performance measurement
    pkgs.psrecord
  ];

  # config options: https://github.com/flightlessmango/MangoHud
  programs.mangohud.enable = true;
  programs.mangohud.settings = {
    output_folder = "~/Documents/";
    log_interval = 100; # in ms
    full = true; # log everything possible
    autostart_log = 1; # star logging after 1 second
    permit_upload = false; # don't upload data to mangohud website
    no_display = false; # toggle mangohud overlay
    position = "bottom-left"; # where to show mangohud overlay
  };

}
