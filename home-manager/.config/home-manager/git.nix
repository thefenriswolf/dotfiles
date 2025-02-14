{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ nix-prefetch-scripts ];

  programs.git = {
    enable = true;
    userEmail = "stefan.rohrbacher97@gmail.com";
    userName = "thefenriswolf";
  };
  programs.git.extraConfig = {
    init = { defaultBranch = "main"; };
    core = { editor = "micro"; };
    alias = {
      pr = "pull --rebase";
      sq = "rebase -i ";
    };
  };
}
