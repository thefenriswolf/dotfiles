# { stdenv, buildPackages, pkgconfig, krb5, libssh, accountservice, json-glib, glib-networking, fetchFromGitHub, perl }:

with import <nixpkgs> {};

stdenv.mkDerivation {
  pname = "cockpit";
  version = "207";

  src = fetchFromGitHub {
    owner = "cockpit-project";
    repo = "cockpit";
    rev = "207";
    sha256 = "1zhrdn6k4i8vz1b3lnvvv505qfmkp4hnblnclbqbbkpd8qhjxx3f";
  };

#  buildInputs = [ pkgconfig nodejs perl libssh fetchFromGitHub ];

  preConfigure = ''
    ./autogen.sh --prefix=/usr --enable-debug
    '';

  meta = with stdenv.lib; {
    description = "A systemd web based user interface for Linux servers";
    homepage = https://cockpit-project.org/;
    license = stdenv.lib.licenses.lgpl21;
    platforms = [ "x86_64-linux" ];
    maintainers = with maintainers; [ thefenriswolf ];
  };
}
