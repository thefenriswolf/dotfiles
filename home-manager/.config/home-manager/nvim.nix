{ config, lib, pkgs, ... }:

{
  programs.neovim.enable = true;
  programs.neovim.plugins = [
    pkgs.vimPlugins.rust-tools-nvim
    pkgs.vimPlugins.nightfox-nvim
    pkgs.vimPlugins.tabby-nvim
    pkgs.vimPlugins.fzf-lua
    pkgs.vimPlugins.feline-nvim
    pkgs.vimPlugins.harpoon
  ];
  programs.neovim.extraLuaConfig = ''
    vim.cmd("colorscheme nightfox")
    vim.o.showtabline = "2"
  '';
}
