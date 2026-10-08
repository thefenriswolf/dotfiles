{ pkgs, ... }:
let
  pname = "org-agenda-cli";
in
pkgs.buildGoModule (finalAttrs: {
  pname = "${pname}";
  version = "81028c1c6315e7ddbd55701053c38f5a9eee9278";

  src = pkgs.fetchFromCodeberg {
    owner = "thefenriswolf";
    repo = "${pname}";
    rev = "${finalAttrs.version}";
    hash = "sha256-Xh/0IWvG+bK9dmXQuRRZrmbkby+x58tuoa72MC3gDns=";
  };
  vendorHash = "sha256-0kFiZadwFnbfkzw8aD9KPfsDS6NHPyYDD0iYwO8lhyA=";

  meta = with pkgs.lib; {
    description = "";
    homepage = "";
    license = licenses.bsd3;
    maintainers = with maintainers; [ thefenriswolf ];
    mainProgram = "qq";
  };
})
