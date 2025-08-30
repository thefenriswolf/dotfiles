{ config, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    widevine-cdm
    # firefox

    tree
    git
    aria2
    wget
    curl

    ghostscript
    ffmpeg
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
    findutils
    binutils
    diffutils
    #coreutils
    uutils-coreutils-noprefix
  ];
}
