{ pkgs, ... }:

pkgs.rustPlatform.buildRustPackage {
  pname = "lover";
  version = "2.1.1";

  buildInputs = [ pkgs.openssl ];
  nativeBuildInputs = [ pkgs.pkg-config ];

  src = pkgs.fetchFromGitHub {
    owner = "Wolfyxon";
    repo = "lover";
    rev = "033b5584e050fc950386d93c2dd389d9630b46a9"; # latest commit
    hash = "sha256-Y96YosbKv0u5AuMvPQhLO0yZM4U8G9g2fFgAWfJyJyc=";
  };
  useFetchCargoVendor = true;
  cargoHash = "sha256-/4aXFMpH+86KpkOaqmcKF585jfI+vz0qESw5rMfLbTI=";

  meta = with pkgs.lib; {
    description = "Love2D runner and cross platform builder inspired by Cargo";
    homepage = "https://github.com/Wolfyxon/lover";
    license = licenses.lgpl21Only;
    maintainers = with maintainers; [ thefenriswolf ];
    mainProgram = "lover";
  };
}
