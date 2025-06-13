{ config, lib, pkgs, ... }:
let unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  services.lorri.enable = true;
  environment.systemPackages = with pkgs; [
    git
    godot-mono
    godotPackages.export-template
    godotPackages.export-template-mono

    wine64
    unstable.zig
    unstable.zls
    unstable.odin
    unstable.ols
  ];
}

