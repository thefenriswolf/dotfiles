with import <nixpkgs> { };

buildGoModule rec {
  pname = "ttt";
  version = "20240307";

  src = fetchFromGitHub {
    owner = "thefenriswolf";
    repo = "ttt";
    rev = "${version}";
    hash = "sha256-rESivh+1tAxVvszydbMMqDE5FoFRTBufDrG2xW1V5ww=";
  };

  vendorHash = "sha256-ekZ5rRbvD8U+UEfqWbPCZ9v++ZDTpAuU3LT9hWlwC5Q=";

  # installPhase = ''
  #   mkdir -p $out
  #   cp ttt* $out/
  # '';

  meta = with lib; {
    description = "Time Tracker Tool written in Golang";
    homepage = "https://github.com/thefenriswolf/ttt";
    license = licenses.bsd3;
    maintainers = with maintainers; [ thefenriswolf ];
  };
}
