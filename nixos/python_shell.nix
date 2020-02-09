with import <nixpkgs> {};
mkShell {
  buildInputs = [
	(python3.withPackages (ps: with ps; [
	pydicom
	numpy
	pillow
	pandas
	python38Packages.opencv4
	]))
    nano
    vim
    git
  ];
}
