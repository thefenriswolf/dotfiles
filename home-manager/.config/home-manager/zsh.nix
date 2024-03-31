{ config, lib, pkgs, ... }:

{
  home.packages = [
    # pkgs.zsh-powerlevel10k
    pkgs.powerline-go
  ];
  programs.zsh.enable = true;
  programs.zsh.autocd = true;
  programs.zsh.history.extended = true;
  programs.zsh.history.size = 50000;
  programs.zsh.history.expireDuplicatesFirst = true;
  programs.zsh.history.ignoreSpace = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.enableVteIntegration = true;

  programs.powerline-go.enable = true;

  programs.zsh.envExtra =
    "if [ -e /home/ro/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ro/.nix-profile/etc/profile.d/nix.sh; fi";
  programs.zsh.initExtra = ''
    HAS_WIDECHARS="false"
  '';
  #    USE_POWERLINE="true"
  #    source ~/.config/zsh/.p10k.zsh

  programs.zsh.shellAliases = {
    ssh = "TERM=xterm-256color ssh";
    l = "eza -alh --total-size";
    doom = "~/.config/emacs/bin/doom";
    emacs = "emacs -nw";
    nano = "micro";
    ll = "eza -l --no-user";
    cat = "bat";
    find = "fd";
    ps = "procs";
    grep = "rg";
    egrep = "egrep --colour=auto";
    fgrep = "fgrep --colour=auto";
    free = "free -m";
    btrfsfree = "sudo btrfs fi us /";
    emc = "emacsclient -t";
    emd = "emacs --daemon";
    e = "emacsclient -ca '''''' ";
    nut =
      "sudo nixos-rebuild build && nvd diff /run/current-system result && notify-me";
    nub = "sudo nixos-rebuild boot && notify-me";
    nus = "sudo nixos-rebuild switch && notify-me";
    notify-me = "notify-send -u normal -t 2000 done";
    gdrivesync = "google-drive-ocamlfuse ~/GDrive";
  };

}
