{ config, lib, pkgs, ... }:
let unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  environment.systemPackages = with pkgs; [ unstable.neovim ];
  #  programs.neovim = {
  #  enable = true;
  #  vimAlias = true;
  #  viAlias = true;
  #  defaultEditor = true;
  #};
}

