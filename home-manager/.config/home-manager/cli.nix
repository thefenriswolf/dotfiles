{ config, lib, pkgs, ... }: {

  programs.btop.enable = true;
  programs.yt-dlp.enable = true;

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
      manager = {
        sort_by = "alphabetical";
        sort_sensitive = true;
        sort_dir_first = true;
        linemode = "size";
        show_hidden = false;
      };
      preview = {
        image_filter = "nearest";
        image_quality = 50;
      };
    };
  };

  programs.fzf = {
    enable = true;
    tmux = { enableShellIntegration = true; };
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    newSession = true; # create new session if none are running
  };

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
    foot = {
      enable = true;
      settings = {
        main = {
          term = "xterm-256color";
          font = "Fira Code:size=9";
          dpi-aware = "yes";
        };
        mouse = { hide-when-typing = "yes"; };
      };
    };
  };
  programs.zathura = {
    enable = true;
    extraConfig = ''
      set selection-clipboard clipboard
    '';
    mappings = { "b" = "adjust_window best-fit"; };
  };
  home.packages = [
    # zfs
    #pkgs.sanoid

    # btrfs
    pkgs.httm

    # document tools
    pkgs.pandoc
    pkgs.diff-pdf

    # QoL
    pkgs.calcurse
    pkgs.fastfetch
    pkgs.ledger
    pkgs.hledger
    pkgs.beancount
    pkgs.fava
    pkgs.reckon
    pkgs.inotify-tools
    pkgs.lorri
    pkgs.sherlock
    (import ./packages/ttt.nix)
    #    (import ./packages/gopta.nix)

    # google drive
    pkgs.google-drive-ocamlfuse

    # file management
    pkgs.ueberzugpp

    # coreutil replacements
    pkgs.eza
    pkgs.bat
    pkgs.fd
    pkgs.procs
    pkgs.tokei
  ];
}
