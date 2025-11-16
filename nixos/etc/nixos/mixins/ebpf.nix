{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bpftrace
    bpftop
    bcc
  ];
  programs.bcc.enable = true;

}
