{ pkgs, ... }:
{
  services.lorri.enable = true;
  environment.systemPackages = with pkgs; [
    git
    tokei
  ];
}
