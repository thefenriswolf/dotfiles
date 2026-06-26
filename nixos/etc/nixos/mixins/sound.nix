{
  config,
  desktop,
  lib,
  pkgs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    alsa-utils
    pulseaudio
    pulsemixer
    pavucontrol
  ];

  nixpkgs.overlays = [
    (final: prev: {
      openblas =
        if prev.stdenv.hostPlatform.system == "i686-linux" then
          prev.openblas.overrideAttrs (_: {
            doCheck = false;
          })
        else
          prev.openblas;
    })
  ];

  #hardware = { pulseaudio.enable = lib.mkForce false; };
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
