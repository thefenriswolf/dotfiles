{ config, lib, pkgs, ... }:
let unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  environment.systemPackages = with pkgs; [
    unstable.neovim
    unstable.zig
    unstable.zls
  ];
}
#  environment.systemPackages = with pkgs; [
#    bintools
#    lynis
#    plantuml
#    jdk
#  ];
#}

