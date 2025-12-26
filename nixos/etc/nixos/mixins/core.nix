{
  config,
  pkgs,
  lib,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    widevine-cdm
    brave
    # firefox

    tree
    git
    aria2
    wget
    curl

    ghostscript
    ffmpeg-full
    imagemagick
    languagetool

    zip
    unzip
    xz
    bzip2
    gzip
    #rar
    gnutar
    p7zip

    pdfgrep
    binutils
    uutils-diffutils
    uutils-findutils
    #coreutils
    (lib.hiPrio uutils-coreutils-noprefix)
  ];
}
