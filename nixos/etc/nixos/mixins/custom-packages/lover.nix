{ pkgs, ... }:

pkgs.rustPlatform.buildRustPackage {
  pname = "lover";
  version = "2.1.1";

  buildInputs = [ pkgs.openssl ];
  nativeBuildInputs = [ pkgs.pkg-config ];

  src = pkgs.fetchFromGitHub {
    owner = "Wolfyxon";
    repo = "lover";
    rev = "v2.1.1";
    hash = "sha256-+RTX6ID/PqK0eGoypl4vudC/ug7ubfLb/UmTKNvNyDk=";
  };
  useFetchCargoVendor = true;
  cargoHash = "sha256-jXglMIEr48RO4FYIcR7ipzDcv6L+dlWFsKFBfooWNW8=";

  meta = with pkgs.lib; {
    description = "Love2D runner and cross platform builder inspired by Cargo";
    homepage = "https://github.com/Wolfyxon/lover";
    license = licenses.lgpl21Only;
    maintainers = with maintainers; [ thefenriswolf ];
    mainProgram = "lover";
  };
}
