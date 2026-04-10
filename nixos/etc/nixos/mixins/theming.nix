{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = {
      system = "base16";
      name = "catppuccin-frappe";
      author = "catppuccin-base16";
      variant = "dark";
      palette = {
        base00 = "303446";
        base01 = "292c3c";
        base02 = "414559";
        base03 = "51576d";
        base04 = "626880";
        base05 = "c6d0f5";
        base06 = "f2d5cf";
        base07 = "babbf1";
        base08 = "e78284";
        base09 = "ef9f76";
        base0A = "e5c890";
        base0B = "a6d189";
        base0C = "81c8be";
        base0D = "8caaee";
        base0E = "ca9ee6";
        base0F = "eebebe";
      };
      # palette = {
      #   base00 = "181818";
      #   base01 = "252525";
      #   base02 = "3b3b3b";
      #   base03 = "777777";
      #   base04 = "777777";
      #   base05 = "b9b9b9";
      #   base06 = "dedede";
      #   base07 = "dedede";
      #   base08 = "ed4a46";
      #   base09 = "e67f43";
      #   base0A = "dbb32d";
      #   base0B = "70b433";
      #   base0C = "3fc5b7";
      #   base0D = "368aeb";
      #   base0E = "a580e2";
      #   base0F = "eb6eb7";
      # };
    };
    opacity = {
      terminal = 0.9;
      popups = 0.9;
    };

    cursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors";
      size = 24;
    };
    # fonts = {
    #   serif = {
    #     package = pkgs.aleo-fonts;
    #     name = "Aleo";
    #   };
    #
    #   sansSerif = {
    #     package = pkgs.noto-fonts-cjk-sans;
    #     name = "Noto Sans CJK JP";
    #   };
    #
    #   monospace = {
    #     package = pkgs.maple-mono.variable;
    #     name = "Maple Mono";
    #   };
    #
    #   emoji = {
    #     package = pkgs.noto-fonts-color-emoji;
    #     name = "Noto Color Emoji";
    #   };
    #
    #   sizes = {
    #     applications = 11;
    #     desktop = 11;
    #     popups = 11;
    #     terminal = 11;
    #   };
    # };
  };

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      paper-icon-theme
      numix-cursor-theme
      quintom-cursor-theme

      adwaita-fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      dina-font
      proggyfonts
      jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.ubuntu
      corefonts
      vista-fonts
      nerd-font-patcher
    ];
  };
}
