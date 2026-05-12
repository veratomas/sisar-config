{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    rust-bin.stable.latest.default
    cargo
    rustc
    rust-analyzer

    # Bevy dependencies
    pkg-config
    alsa-lib
    udev
    vulkan-loader

    # X11 libraries
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
  ];

  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.vulkan-loader
    pkgs.xorg.libX11
    pkgs.xorg.libXcursor
    pkgs.xorg.libXrandr
    pkgs.xorg.libXi
  ];

  shellHook = ''
    export name=rust-bevy
    exec nu
  '';
}
