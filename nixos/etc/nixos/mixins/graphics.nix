{
  config,
  lib,
  pkgs,
  ...
}:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.firmware = [ pkgs.linux-firmware ];
}
