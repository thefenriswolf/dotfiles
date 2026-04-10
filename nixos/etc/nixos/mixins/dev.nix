{ pkgs, ... }:
{
  services.lorri.enable = true;
  environment.systemPackages = with pkgs; [
    git
    tokei

    jetbrains.idea-oss
    jetbrains.jdk
  ];
}
