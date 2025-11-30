{
  pkgs ? import <nixpkgs> { },
}:

pkgs.buildDotnetModule rec {
  pname = "uvtools";
  version = "5.2.1"; # Update to latest from https://github.com/sn4k3/UVtools/releases

  src = pkgs.fetchFromGitHub {
    owner = "sn4k3";
    repo = "UVtools";
    rev = "v${version}";
    hash = "sha256-59cW3aR7UuYKACd0WIubxBqQQIFQiX4eNR3cPIg3vVk="; # Run `nix-prefetch-github sn4k3 UVtools --rev v${version}` to get this
  };

  projectFile = "UVtools.UI/UVtools.UI.csproj"; # Builds the entire solution
  nugetDeps = ./deps.nix; # We'll generate this in Step 2

  dotnet-sdk = pkgs.dotnetCorePackages.sdk_9_0;
  dotnet-runtime = pkgs.dotnetCorePackages.runtime_9_0;

  # Native/runtime dependencies (similar to shell.nix)
  buildInputs = with pkgs; [
    opencv # For OpenCVSharp native bindings
    gtk3 # For file dialogs in Avalonia
    glib
    icu # Globalization
    libgdiplus # System.Drawing
    fontconfig
    pango
    cairo
    gdk-pixbuf # Rendering
    xorg.libICE
    xorg.libSM
    dbus # X11/DBus
    mesa # OpenGL if needed
    adwaita-icon-theme
    gnome-themes-extra # Themes to fix transparency
  ];

  # Post-build fixes: Ensure native libs are found at runtime
  postFixup = ''
    wrapProgram $out/bin/UVtools \
      --prefix LD_LIBRARY_PATH : "${pkgs.lib.makeLibraryPath buildInputs}" \
      --prefix XDG_DATA_DIRS : "${pkgs.adwaita-icon-theme}/share:${pkgs.gnome-themes-extra}/share"
  '';

  meta = with pkgs.lib; {
    description = "MSLA/DLP 3D printer file tool";
    homepage = "https://github.com/sn4k3/UVtools";
    license = licenses.agpl3Only;
    platforms = platforms.linux;
  };
}
