{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    config = {
      user = {
        email = "stefan.rohrbacher97@gmail.com";
        name = "thefenriswolf";
      };
      init = {
        defaultBranch = "main";
      };
      core = {
        editor = "vi";
      };
      alias = {
        clown = "clone --recurse-submodules --recursive";
        pr = "pull --rebase";
        puf = "push -f";
      };
    };
  };
}
