{ config, pkgs, ... }: {
  # https://nixos.wiki/wiki/Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    package = pkgs.bluez;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = false;
      };
    };
  };
  services.blueman.enable = false; # bluetooth gui for tiling WM
}
