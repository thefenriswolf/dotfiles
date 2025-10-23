{ config, pkgs, ... }: {
  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
    package = pkgs.openrgb;
  };
  environment.systemPackages = with pkgs; [ openrgb-plugin-effects ];
}
