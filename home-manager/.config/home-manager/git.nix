{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.nix-prefetch-scripts ];

  programs.git = {
    enable = true;
    userEmail = "stefan.rohrbacher97@gmail.com";
    userName = "thefenriswolf";
  };
  programs.git.extraConfig = {
    init = { defaultBranch = "main"; };
    core = { editor = "nano"; };
    alias = {
      pr = "pull --rebase";
      squash = "rebase -i HEAD~";
    };
  };
}
