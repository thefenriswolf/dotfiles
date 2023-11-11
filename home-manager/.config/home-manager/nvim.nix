{ config, lib, pkgs, ... }:

{
  programs.neovim.enable = false;
  programs.neovim.plugins = [
    pkgs.vimPlugins.rust-tools-nvim
    pkgs.vimPlugins.nightfox-nvim
    pkgs.vimPlugins.tabby-nvim
    pkgs.vimPlugins.fzf-lua
    pkgs.vimPlugins.feline-nvim
    pkgs.vimPlugins.orgmode
  ];
  programs.neovim.extraLuaConfig = ''
        vim.cmd("colorscheme nightfox")
        vim.o.showtabline = "2"
        require('feline').setup()
    require('orgmode').setup_ts_grammar()
  '';
}
