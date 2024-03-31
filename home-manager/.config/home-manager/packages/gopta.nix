with import <nixpkgs> { };

buildGoModule rec {
  pname = "gopta";
  version = "v20240331";

  src = fetchFromGitHub {
    owner = "thefenriswolf";
    repo = "fin";
    rev = "13e5a72d7b75862391c351e32b6f15c59b0e826a";
    hash = "sha256-4vIFlAobg7Izb2HrES6syXEE+MIessIZHy9zy9m4aMU=";
  };
  vendorHash = null;

  meta = with lib; {
    description = "Time Tracker Tool written in Golang";
    homepage = "https://github.com/thefenriswolf/ttt";
    license = licenses.mit;
    maintainers = with maintainers; [ thefenriswolf ];
  };
}
