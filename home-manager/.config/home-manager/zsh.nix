{ config, lib, pkgs, ... }:

{
  home.packages = [
    # pkgs.zsh-powerlevel10k
    pkgs.powerline-go
  ];

  programs.zsh = {
    enable = true;
    autocd = true;
    history = {
      extended = true;
      size = 50000;
      expireDuplicatesFirst = true;
      ignoreSpace = true;
    };
    syntaxHighlighting.enable = true;
    autosuggestion = { enable = true; };
    enableVteIntegration = true;
  };

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
    l = "ls -lisah";
    doom = "~/.config/emacs/bin/doom";
    emacs = "emacs -nw";
    nano = "micro";
    # ll = "eza -l --no-user";
    cat = "bat";
    find = "fd";
    ps = "procs";
    watch = "viddy";
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
