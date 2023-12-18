{ config, lib, pkgs, ... }:

{
  services.usbmuxd = {
    enable = true;
    package = pkgs.usbmuxd2;
  };

  environment.systemPackages = with pkgs; [
    libimobiledevice
    idevicerestore
    ifuse # optional, to mount using 'ifuse'
  ];

}
