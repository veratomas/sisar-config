{ mkShell, pkgs }:

mkShell {
  system = "x86_64-linux";
  name = "python-sisar";
  workspaceRoot = ./.;
  extraPackages = [
  ];
  shellHook = ''
    exec nu
  '';
}
