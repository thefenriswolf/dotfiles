{ config, pkgs, ... }: {
  fonts.packages = with pkgs; [ jetbrains-mono nerd-font-patcher ];
  nixpkgs.config.packageOverrides = pkgs: {
    colloid-icon-theme =
      pkgs.colloid-icon-theme.override { colorVariants = [ "teal" ]; };
    catppuccin-gtk = pkgs.catppuccin-gtk.override {
      accents = [
        "teal"
      ]; # You can specify multiple accents here to output multiple themes
      size = "standard";
      variant = "macchiato";
    };
  };
  environment.systemPackages = with pkgs; [
    catppuccin-gtk
    catppuccin-kvantum
    catppuccin-cursors.macchiatoTeal
  ];
}
