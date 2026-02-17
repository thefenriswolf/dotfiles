{
  config,
  lib,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [ ]; # systeroid ];
  services.sysprof.enable = true;

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 30;
  };
}
