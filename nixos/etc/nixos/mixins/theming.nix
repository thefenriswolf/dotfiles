{ config, pkgs, ... }: {
  fonts.packages = with pkgs; [ jetbrains-mono nerd-font-patcher ];
  nixpkgs.config.packageOverrides = pkgs: {
    colloid-icon-theme =
      pkgs.colloid-icon-theme.override { colorVariants = [ "teal" ]; };
  };
}
