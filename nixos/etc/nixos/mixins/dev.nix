{ config, lib, pkgs, ... }:
let unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  services.lorri.enable = true;
  environment.systemPackages = with pkgs; [
    git
    wine64
    unstable.zig
    unstable.zls
    unstable.odin
    unstable.ols
  ];
}

