{
  mkShell,
  pkgs,
}:
mkShell {
  system = "x86_64-linux";
  name = "python";
  workspaceRoot = ./.;
  extraPackages = [
    pkgs.tcl
    pkgs.tk
    pkgs.python314Packages.tkinter
  ];
  shellHook = ''
    exec nu
  '';
}
