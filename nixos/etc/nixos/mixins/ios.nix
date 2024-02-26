{ config, lib, pkgs, ... }:

{
  services.usbmuxd = {
    enable = false;
    package = pkgs.usbmuxd2;
  };
  services.udisks2 = { enable = true; };
  environment.systemPackages = with pkgs; [
    libimobiledevice
    idevicerestore
    ifuse # optional, to mount using 'ifuse'
  ];

}
