{ config, lib, pkgs, ... }:
let unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  environment.systemPackages = with pkgs; [
    unstable.neovim
    unstable.zig
    #unstable.zls
    #unstable.odin
    #unstable.ols
    pkgs.gomatrix
    pkgs.gotop
  ];
}

#programs.neovim.vimAlias=true;

#  environment.systemPackages = with pkgs; [
#    bintools
#    lynis
#    plantuml
#    jdk
#  ];
#}

