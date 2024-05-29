{ config, lib, pkgs, ... }: {
  programs.zellij.enable = true;

  # hyprland
  xdg.configFile."hypr/hyprland.conf".source =
    /home/ro/playground/dotfiles/hyprland/.config/hypr/hyprland.conf;
  xdg.configFile."hypr/themes/frappe.conf".source =
    /home/ro/playground/dotfiles/hyprland/.config/hypr/themes/frappe.conf;
  xdg.configFile."hypr/themes/latte.conf".source =
    /home/ro/playground/dotfiles/hyprland/.config/hypr/themes/latte.conf;
  xdg.configFile."hypr/themes/macchiato.conf".source =
    /home/ro/playground/dotfiles/hyprland/.config/hypr/themes/macchiato.conf;
  xdg.configFile."hypr/themes/mocha.conf".source =
    /home/ro/playground/dotfiles/hyprland/.config/hypr/themes/mocha.conf;

  # waybar
  xdg.configFile."waybar/config".source =
    /home/ro/playground/dotfiles/waybar/.config/waybar/config;
  xdg.configFile."waybar/style.css".source =
    /home/ro/playground/dotfiles/waybar/.config/waybar/style.css;

  programs.qutebrowser = {
    enable = true;
    enableDefaultBindings = true;
    searchEngines = {
      hm = "https://home-manager-options.extranix.com/?query={}";
      nw = "https://wiki.nixos.org/index.phh?search={}";
      g = "https://www.google.com/search?hl=en&q={}";
      yt = "https://www.youtube.com/results?search_query={}";
      ddg = "https://duckduckgo.com/?q={}";
    };
    # settings = { };
  };

  home.packages = [ pkgs.ioztat ];
}
