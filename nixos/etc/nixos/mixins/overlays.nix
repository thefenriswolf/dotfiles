{ ... }:
{
  nixpkgs.overlays = [
    (self: super: {
      dmenuOpt = super.dmenu.overrideAttrs (old: {
        configureFlags = (old.configureFlags or [ ]) ++ [
          "-O2"
          "-fPIC"
          "-frecord-gcc-switches"
          "-march=native"
          "-mtune=native"
          "-s"
        ];
        NIX_CFLAGS_COMPILE = (old.NIX_CFLAGS_COMPILE or [ ]) ++ [
          "-O2"
          "-fPIC"
          "-frecord-gcc-switches"
          "-march=native"
          "-mtune=native"
          "-s"
        ];
        NIX_CXXFLAGS_COMPILE = (old.NIX_CFLAGS_COMPILE or [ ]) ++ [
          "-frecord-gcc-switches"
          "-O2"
          "-fPIC"
          "-march=native"
          "-mtune=native"
          "-s"
        ];
      });
    })
    (self: super: {
      helloOpt = super.hello.overrideAttrs (old: {
        NIX_CFLAGS_COMPILE = (old.NIX_CFLAGS_COMPILE or [ ]) ++ [
          "-frecord-gcc-switches"
          "-O3"
          "-fPIC"
          "-march=native"
          "-mtune=native"
          "-s"
        ];
      });
    })

  ];
}
