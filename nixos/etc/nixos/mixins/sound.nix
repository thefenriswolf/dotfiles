{ config, desktop, lib, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    alsa-utils
    pulseaudio
    pulsemixer
    pavucontrol
  ];

  hardware = { pulseaudio.enable = lib.mkForce false; };
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = false;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };
}

