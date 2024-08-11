{ config, lib, pkgs, ... }: {

  programs.zellij = {
    enable = true;
    enableZshIntegration = false;
    # https://zellij.dev/documentation/configuration
    settings = { theme = "default"; };
  };

  # hyprland
  xdg.configFile."hypr/hyprland.conf".source =
    /home/ro/playground/dotfiles/hyprland/.config/hypr/hyprland.conf;
  xdg.configFile."hypr/themes/frappe.conf".source =
    /home/ro/playground/dotfiles/hyprland/.config/hypr/themes/frappe.conf;
  xdg.configFile."hypr/themes/latte.conf".source =
    /home/ro/playground/dotfiles/hyprland/.config/hypr/themes/latte.conf;
  xdg.configFile."hypr/themes/macchiato.conf".source =
    /home/ro/playground/dotfiles/hyprland/.config/hypr/themes/macchiato.conf;
  xdg.configFile."hypr/themes/mocha.conf".source =
    /home/ro/playground/dotfiles/hyprland/.config/hypr/themes/mocha.conf;

  # waybar
  # xdg.configFile."waybar/config".source =
  #   /home/ro/playground/dotfiles/waybar/.config/waybar/config;
  # xdg.configFile."waybar/style.css".source =
  #   /home/ro/playground/dotfiles/waybar/.config/waybar/style.css;

  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "graphical-session.target";
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        padding: 0;
        margin: 2px;
        font-size: 16px;
      }
      window#waybar {
        background: #292828;
        color: #ffffff;
      }
      #custom-logo {
        font-size: 18px;
        margin: 0;
        margin-left: 7px;
        margin-right: 12px;
        padding: 0;
        font-family: NotoSans Nerd Font Mono;
      }
      #workspaces button {
        margin-right: 10px;
        color: #ffffff;
      }
      #workspaces button:hover, #workspaces button:active {
        background-color: #292828;
        color: #ffffff;
      }
      #workspaces button.focused {
        background-color: #383737;
      }
      #language {
        margin-right: 7px;
      }
      #battery {
        margin-left: 7px;
        margin-right: 3px;
      }
    '';
    settings = {
      # icons: https://www.w3schools.com/charsets/ref_utf_basic_latin.asp
      mainBar = {
        layer = "top";
        position = "top";
        height = 36;
        spacing = 4;
        output = [ "HDMI-A-2" "eDP-1" ];
        modules-left = [
          "custom/logo"
          "hyprland/workspaces"
          "hyprland/submap"
          "pulseaudio"
        ];
        modules-center = [ "hyprland/window" "keyboard-state" "temperature" ];
        modules-right = [
          "backlight"
          "network"
          #          "bluetooth"
          "cpu"
          "memory"
          "clock"
          "battery"
        ];
        "custom/logo" = {
          format = "{icon}";
          format-icon = "";
          tooltip = false;
          on-click = "foot emacs";
        };
        "hyprland/workspaces" = {
          on-click = "activate";
          disable-scroll = false;
          on-scroll-up = "hyprctl dispatch workspace m-1 > /dev/null";
          on-scroll-down = "hyprctl dispatch workspace m+1 > /dev/null";
          all-outputs = true;
          format = "{name}";
          persistent-workspaces = {
            "1" = [ ];
            "2" = [ ];
          };
        };
        "hyprland/window" = {
          max-length = 50;
          separate-outputs = true;
        };
        "hyprland/submap" = {
          format = "<span color='#a6da95'>Mode:</span> {}";
          tooltip = false;
        };
        "keyboard-state" = {
          numlock = false;
          capslock = false;
          format = "{name} {icon}";
          format-icons = {
            locked = "⚿";
            unlocked = "⌨";
          };
        };
        "cpu" = {
          format = "{usage}% {icon}";
          tooltip = true;
          on-click = "foot btop";
          format-icons = [ "▣" ];
        };
        "memory" = {
          format = "{usage}% {icon}";
          tooltip = true;
          on-click = "foot btop";
          format-icons = [ "◔" "⛁" ];
        };
        "backlight" = {
          format = "{percent}% {icon}";
          format-icons = [ "☼" "☾" ];
        };
        "temperature" = {
          format = "{temperatureC}°C {icon}";
          format-icons = [ "♨" ];
        };
        "clock" = {
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };
        "battery" = {
          format = "{capacity}% {icon}";
          tooltip = false;
          states = {
            "good" = 95;
            "warning" = 35;
            "critical" = 20;
          };
          format-icons = {
            warning = "⏻";
            critical = "☠";
            good = "⚡";
          };
        };
        "network" = {
          format-icons = [ "☢" "⛗" ];
          format-wifi =
            "<span color='#589df6'><U+F1EB></span> <span color='gray'>{essid}</span> {frequency} <span color='#589df6'>{signaldBm} dB</span> <span color='#589df6'>⇵</span> {bandwidthUpBits}/{bandwidthDownBits}";
          format-ethernet = "{ifname}: {ipaddr}/{cidr} <U+F796>";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
          format-disconnected = "Disconnected!";
          "interval" = 5;
        };
        "pulseaudio" = {
          format = "{volume}% {icon} {format_source}";
          format-icons = [ "♬" ];
          on-click = "pavucontrol";
        };
      };
    };
  };

  programs.qutebrowser = {
    enable = true;
    enableDefaultBindings = true;
    searchEngines = {
      hm = "https://home-manager-options.extranix.com/?query={}";
      nw = "https://wiki.nixos.org/index.phh?search={}";
      g = "https://www.google.com/search?hl=en&q={}";
      yt = "https://www.youtube.com/results?search_query={}";
      ddg = "https://duckduckgo.com/?q={}";
    };
    # settings = { };
  };

  home.packages = [ pkgs.ioztat pkgs.eww ];
}
