with import <nixpkgs> { };

buildGoModule rec {
  pname = "org-agenda-cli";
  version = "9484d28a546e1c0ac288834573c0156fdfdae75e";

  src = fetchFromCodeberg {
    owner = "thefenriswolf";
    repo = "org-agenda-cli";
    rev = "${version}";
    hash = "";
  };
  vendorHash = "";

  meta = with lib; {
    description = "";
    homepage = "";
    license = licenses.bsd3;
    maintainers = with maintainers; [ thefenriswolf ];
  };
}
