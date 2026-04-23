{
  config,
  lib,
  pkgs,
  ...
}:
{
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

  # networking.nat = {
  #   enable = true;
  #   internalInterfaces = [ "ve-+" ];
  #   externalInterface = "wlan0";
  #   enableIPv6 = false;
  # };
  #
  # containers.HA = {
  #   autoStart = true;
  #   privateNetwork = false;
  #   config =
  #     {
  #       config,
  #       pkgs,
  #       lib,
  #       ...
  #     }:
  #     {
  #       services.home-assistant = {
  #         enable = true;
  #         openFirewall = true;
  #         configWritable = false;
  #         #extraArgs = [ "--debug" ];
  #         extraComponents = [
  #           "analytics"
  #           "default_config"
  #           "esphome"
  #           "analytics"
  #           "google_translate"
  #           "met"
  #           "radio_browser"
  #           "shopping_list"
  #           "isal"
  #           "mqtt"
  #           "shelly"
  #           "fire_tv"
  #           "modbus"
  #         ];
  #         config = {
  #           default_config = { };
  #           frontend = { };
  #           homeassistant = {
  #             name = "Home";
  #             unit_system = "metric";
  #             time_zone = "Europe/Vienna";
  #             temperature_unit = "C";
  #             latitude = "46.815529";
  #             longitude = "15.216370";
  #             auth_providers = [
  #               {
  #                 type = "homeassistant";
  #               }
  #               {
  #                 type = "trusted_networks";
  #                 trusted_networks = [ "172.0.0.1" ];
  #               }
  #             ];
  #           };
  #            shelly = {
  #              username = "!secret shelly_username";
  #              password = "!secret shelly_password";
  #              devices = [
  #                {
  #                  id = "shellyplug-s-XXXXXX";
  #                  host = "192.168.178.50"; # IP des Shelly
  #                }
  #              ];
  #            };
  #           modbus = [
  #             {
  #               name = "tsun_inverter";
  #               type = "tcp";
  #               host = "192.168.1.100";
  #               port = 502;
  #               sensors = [
  #                 {
  #                   name = "TSUN Leistung";
  #                   slave = 1;
  #                   address = 30000;
  #                   data_type = "uint16";
  #                   unit_of_measurement = "W";
  #                   scale = 0.1;
  #                   precision = 1;
  #                   scan_interval = 10;
  #                 }
  #                 {
  #                   name = "TSUN Tagesertrag";
  #                   slave = 1;
  #                   address = 30002;
  #                   data_type = "uint32";
  #                   unit_of_measurement = "kWh";
  #                   scale = 0.01;
  #                   precision = 2;
  #                   swap = "word";
  #                   scan_interval = 60;
  #                 }
  #                 {
  #                   name = "TSUN Gesamtertrag";
  #                   slave = 1;
  #                   address = 30004;
  #                   data_type = "uint32";
  #                   unit_of_measurement = "kWh";
  #                   scale = 0.01;
  #                   precision = 2;
  #                   swap = "word";
  #                   scan_interval = 300;
  #                 }
  #                 {
  #                   name = "TSUN Temperatur";
  #                   slave = 1;
  #                   address = 30011;
  #                   data_type = "uint16";
  #                   unit_of_measurement = "°C";
  #                   scale = 0.1;
  #                   device_class = "temperature";
  #                   scan_interval = 30;
  #                 }
  #               ];
  #             }
  #           ];
  #         };
  #       };
  #       system.stateVersion = "25.11";
  #     };
  # };

}
