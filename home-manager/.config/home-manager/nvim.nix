{ config, lib, pkgs, ... }:

{
  programs.neovim.enable = true;
  programs.neovim.plugins = [
    pkgs.vimPlugins.nightfox-nvim
    pkgs.vimPlugins.tabby-nvim
    pkgs.vimPlugins.fzf-lua
    pkgs.vimPlugins.feline-nvim
    pkgs.vimPlugins.harpoon
  ];
  programs.neovim.extraLuaConfig = ''
    vim.o.showtabline = "2"
  '';
}
