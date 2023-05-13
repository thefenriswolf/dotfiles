{ config, lib, pkgs, ... }:

{
  programs.bash.enable = true;
  programs.bash.shellAliases = {
    sl = "ls -lisah";
    doom = "$HOME/.emacs.d/bin/doom";
    nv = "nvim";
    ".." = "cd ..";
    ll = "ls -alF";
    la = "ls -A";
    l = "ls -CF";
    alert = "notify-send --urgency=low";
    ls = "ls --color=auto";
    dir = "dir --color=auto";
    vdir = "vdir --color=auto";
    grep = "grep --color=auto";
    fgrep = "fgrep --color=auto";
    egrep = "egrep --color=auto";
  };
  programs.bash.historyControl = [ "ignorespace" "ignoredups" ];
  programs.bash.enableCompletion = true;
  programs.bash.historyFileSize = 6000;
  programs.bash.historySize = 1000;
  programs.bash.shellOptions = [ "histappend" "checkwinsize" "globstar" ];
  programs.bash.bashrcExtra = ''
    debian_chroot=$(cat /etc/debian_chroot)
    xterm-color|*-256color) color_prompt=yes
    export PATH='$HOME/.local/bin:$HOME/bin:/usr/local/bin/:/usr/bin:/bin:$HOME/opt/bin'
    # [ -x /usr/bin/lesspipe ] && eval '$(SHELL=/bin/sh lesspipe)'
    PS1='[3[01;32m]u@h[3[00m]:[3[01;34m]w[3[00m]$ '
  '';

}
