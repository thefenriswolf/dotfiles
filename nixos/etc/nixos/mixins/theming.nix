{ config, pkgs, ... }: {

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      jetbrains-mono
      nerdfonts
      corefonts
      vistafonts
      nerd-font-patcher
    ];
  };
}
