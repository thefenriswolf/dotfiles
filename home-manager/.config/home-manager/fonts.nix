{ config, lib, pkgs, ... }:

{
  home-packages = [
    # copy fonts from ls .nix-profile/share/fonts/truetype/ to .local/share/fonts
    # $ cp -r .nix-profile/share/fonts/ ~/.local/share/fonts/
    # combine multiple fonts
    # mkdir .config/fontconfig/
    # create fonts.conf
    pkgs.jetbrains-mono
    pkgs.fira-code
    pkgs.noto-fonts-emoji
    pkgs.nerdfonts
  ];
}
# fonts.conf
# <?xml version='1.0'?>
#<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
#<fontconfig>
#  <alias>
#    <family>terminal-font</family>
#    <prefer>
#      <family>JetBrains Mono</family>
#      <family>Noto Color Emoji</family>
#      <family>Fira Code Light</family>
#     </prefer>
#  </alias>
#</fontconfig>