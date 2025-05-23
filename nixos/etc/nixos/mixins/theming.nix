{ config, pkgs, ... }: {

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      jetbrains-mono
      nerd-fonts.fira-code
      corefonts
      vistafonts
      nerd-font-patcher
    ];
  };
}
