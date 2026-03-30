{ pkgs, ... }:
{
  services.lorri.enable = true;
  environment.systemPackages = with pkgs; [
    git
    tokei

    jetbrains.idea-oss
    jetbrains.jdk

    ollama
    ollama-cpu
    ollama-vulkan
  ];
}
