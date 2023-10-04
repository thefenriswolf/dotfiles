{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userEmail = "stefan.rohrbacher97@gmail.com";
    userName = "thefenriswolf";
  };
  programs.git.extraConfig = {
    init = { defaultBranch = "main"; };
    core = { editor = "nano"; };
    alias = { pr = "pull --rebase"; };
  };
}
