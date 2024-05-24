{ config, lib, pkgs, ... }: {
  programs.zellij.enable = true;

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
