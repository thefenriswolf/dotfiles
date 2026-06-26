{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.evcc.enable = false;
  services.evcc.settings = {
    network = {
      schema = "http";
      host = "0.0.0.0";
      port = 7070;
    };
    site = {
      title = "Home";
      meters = {
        grid = "my_grid";
        pv = [ "my_pv" ];
        battery = [ "my_battery" ];
      };
    };
    tariffs = {
      currency = "EUR";
      grid = {
        type = "fixed";
        price = 0.18;
      };
      feedin = {
        type = "fixed";
        price = 0.0;
      };
    };
    loadpoints = [
      {
        title = "Garage";
        charger = "my_charger";
        vehicle = "my_car";
      }
    ];
    chargers = [
      {
        name = "my_charger";
        type = "template";
        template = "demo-charger";
        status = "C";
        power = 2000;
        enabled = true;
      }
    ];
    vehicles = [
      {
        name = "my_car";
        type = "template";
        template = "offline";
        title = "EV";
        capacity = 50;
      }
    ];
    meters = [
      {
        name = "my_grid";
        type = "template";
        template = "demo-meter";
        usage = "grid";
        power = -1000;
      }
      {
        name = "my_pv";
        type = "template";
        template = "demo-meter";
        usage = "pv";
        power = 4000;
      }
      {
        name = "my_battery";
        type = "template";
        template = "demo-battery";
        usage = "battery";
        power = -1000;
        soc = 50;
      }
      {
        name = "PC-Plug";
        type = "template";
        template = "shelly-1pm";
        usage = "grid";
        host = "192.168.1.106";
      }
      {
        name = "Waschmaschine-Plug";
        type = "template";
        template = "shelly-1pm";
        usage = "grid";
        host = "192.168.1.111";
      }
      {
        name = "Geschirrspüler-Plug";
        type = "template";
        template = "shelly-1pm";
        usage = "grid";
        host = "192.168.1.109";
      }
      {
        name = "TV-Plug";
        type = "template";
        template = "shelly-1pm";
        usage = "grid";
        host = "192.168.1.101";
      }
      {
        name = "Kaffee-Plug";
        type = "template";
        template = "shelly-1pm";
        usage = "grid";
        host = "192.168.1.102";
      }
    ];
  };

  services.immich = {
    enable = false;
    machine-learning.enable = true;
    accelerationDevices = [ "/dev/dri/renderD128" ];
    openFirewall = true;
    host = "0.0.0.0";
    port = 2222;
    mediaLocation = "/var/lib/immich";
  };

  # users.users.immich.extraGroups = ["video" "render"];
  # systemd.services.immich-server.serviceConfig.ExecStartPre = "/usr/bin/env sleep 30";

}
