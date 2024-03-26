with import <nixpkgs> { };

buildGoModule rec {
  pname = "gopta";
  version = "v20240326";

  src = fetchFromGitHub {
    owner = "thefenriswolf";
    repo = "fin";
    rev = "${version}";
    hash = "sha256-vZcCOl2V6sP10nbdiaF85CiPJaPY+QG+ERKRAbPx3yY=";
  };
  vendorHash = "sha256-vZcCOl2V6sP10nbdiaF85CiPJaPY+QG+ERKRAbPx3yY=";

  meta = with lib; {
    description = "CSV to beancount/ledger converter";
    homepage = "https://github.com/thefenriswolf/gopta";
    license = licenses.mit;
    maintainers = with maintainers; [ thefenriswolf ];
  };
}
