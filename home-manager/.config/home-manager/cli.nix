{ config, lib, pkgs, ... }: {

  programs.btop.enable = true;
  programs.yt-dlp.enable = true;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.yazi = {
    enable = true;
    catppuccin.enable = true;
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
    catppuccin.enable = true;
    tmux = { enableShellIntegration = true; };
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    catppuccin.enable = true;
    newSession = true; # create new session if none are running
  };

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
    foot = {
      # https://codeberg.org/dnkl/foot/src/branch/master/foot.ini
      enable = true;
      settings = {
        main = {
          term = "xterm-256color";
          font = "Fira Code:size=11";
          dpi-aware = "no";
        };
        mouse = { hide-when-typing = "yes"; };
      };
    };
  };

  programs.zathura = {
    enable = true;
    catppuccin.enable = false;
    extraConfig = ''
      set selection-clipboard clipboard
    '';
    mappings = { "b" = "adjust_window best-fit"; };
  };
  home.packages = [
    # zfs
    #pkgs.sanoid

    # top
    pkgs.nvtopPackages.amd
    pkgs.lm_sensors
    pkgs.psensor
    pkgs.hddtemp
    pkgs.acpi
    pkgs.inxi
    pkgs.viddy

    # btrfs
    pkgs.httm

    # document tools
    pkgs.pandoc
    pkgs.diff-pdf
    pkgs.veracrypt

    # QoL
    pkgs.comma
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
    (import ./packages/gopta.nix)

    # cloud storage: google drive, dropbox
    pkgs.google-drive-ocamlfuse
    pkgs.rclone

    # file management
    pkgs.ueberzugpp

    # coreutil replacements
    pkgs.bat
    pkgs.fd
    pkgs.procs
    pkgs.tokei
  ];
}
