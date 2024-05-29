with import <nixpkgs> { };

buildGoModule rec {
  pname = "gopta";
  version = "v20240331";

  src = fetchFromGitHub {
    owner = "thefenriswolf";
    repo = "fin";
    rev = "13e5a72d7b75862391c351e32b6f15c59b0e826a";
    hash = "sha256-6N2cHnFOyuPkrUHCLFYKi4OuzF7zNqTMJoIc/RNLzv4=";
  };
  vendorHash = "sha256-0HDZ3llIgLMxRLNei93XrcYliBzjajU6ZPllo3/IZVY=";

  meta = with lib; {
    description = "Time Tracker Tool written in Golang";
    homepage = "https://github.com/thefenriswolf/ttt";
    license = licenses.mit;
    maintainers = with maintainers; [ thefenriswolf ];
  };
}
