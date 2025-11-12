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
    extraPackages = with pkgs; [ libvdpau-va-gl ];
    extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
  };
}
