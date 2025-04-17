{ config, lib, pkgs, inputs, ... }: {

  nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlays.default ];

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
    configure = {
      # lib.fileContents /home/ro/playground/dotfiles/nvim/init.lua;
      # luafile ${/home/ro/playground/dotfiles/nvim/init.lua}
      #customRC = '' '';
    };
  };
}

