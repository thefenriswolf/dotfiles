with import <nixpkgs> { };

buildGoModule rec {
  pname = "ttt";
  version = "v20240323";

  src = fetchFromGitHub {
    owner = "thefenriswolf";
    repo = "ttt";
    rev = "${version}";
    hash = "sha256-bYfuh0SAIVm8KfCMXEhmBJjsw423jp22j3QXEiCNO/E=";
  };
  vendorHash = "sha256-ekZ5rRbvD8U+UEfqWbPCZ9v++ZDTpAuU3LT9hWlwC5Q=";

  meta = with lib; {
    description = "Time Tracker Tool written in Golang";
    homepage = "https://github.com/thefenriswolf/ttt";
    license = licenses.bsd3;
    maintainers = with maintainers; [ thefenriswolf ];
  };
}
