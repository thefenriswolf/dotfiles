{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bpftrace
    bpftop
  ];
  programs.bcc.enable = true;

}
