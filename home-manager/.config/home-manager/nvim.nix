{ config, lib, pkgs, ... }:

let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "nixos-23.11";
  });
in {
  imports = [ nixvim.homeManagerModules.nixvim ];
  programs.nixvim = {
    enable = true;
    vimAlias = true;
    colorschemes.gruvbox.enable = true;
    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
    plugins = {
      lightline.enable = true;
      harpoon.enable = true;
    };
    # extraPlugins = with pkgs.vimPlugins; [
    #   nightfox-nvim
    #   tabby-nvim
    #   fzf-lua
    #   feline-nvim
    #   harpoon
    #   orgmode
    #   nvim-lspconfig
    #   nvim-treesitter.withAllGrammars
    #   gruvbox-material
    # ];
    # extraLuaConfig = # lua
    #   ''
    #     vim.o.showtabline = "2"
    #     vim.o.termguicolors = true
    #   '';
  };
}
