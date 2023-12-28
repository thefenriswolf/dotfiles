{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.zsh-powerlevel10k ];
  programs.zsh.enable = true;
  programs.zsh.autocd = true;
  programs.zsh.history.extended = true;
  programs.zsh.history.size = 50000;
  programs.zsh.history.expireDuplicatesFirst = true;
  programs.zsh.history.ignoreSpace = true;
  # programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.enableVteIntegration = true;

  programs.zsh.plugins = [{
    name = "powerlevel10k";
    src = pkgs.zsh-powerlevel10k;
    file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  }];

  programs.zsh.envExtra =
    "if [ -e /home/ro/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ro/.nix-profile/etc/profile.d/nix.sh; fi";
  programs.zsh.initExtra = ''
    USE_POWERLINE="true"
    HAS_WIDECHARS="false"
    USE_POWERLINE="true"
    source ~/.config/zsh/.p10k.zsh
  '';
  programs.zsh.shellAliases = {
    ssh = "TERM=xterm-256color ssh";
    ll = "ls -lisah";
    doom = "~/.config/emacs/bin/doom";
    emacs = "emacs -nw";
    ls = "ls --color=auto";
    grep = "grep --colour=auto";
    egrep = "egrep --colour=auto";
    fgrep = "fgrep --colour=auto";
    free = "free -m";
    btrfsfree = "sudo btrfs fi us /";
    emc = "emacsclient -t";
    emd = "emacs --daemon";
    nixos-upgrade =
      "sudo nixos-rebuild build && nvd diff /run/current-system result";
    notify-me = "notify-send -u normal -t 2000 done";
    gdrivesync = "google-drive-ocamlfuse ~/GDrive";
  };

}
