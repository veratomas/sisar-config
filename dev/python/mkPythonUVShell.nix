{
  nixpkgs,
  pyproject-nix,
  uv2nix,
  pyproject-build-systems,
}:

{
  system,
  workspaceRoot,
  extraPackages ? [ ],
  shellHook ? "",
  name,
}:

let
  inherit (nixpkgs) lib;

  workspace = uv2nix.lib.workspace.loadWorkspace {
    inherit workspaceRoot;
  };
  overlay = workspace.mkPyprojectOverlay {
    sourcePreference = "wheel";
  };
  pythonSets.${system} =
    let
      pkgs = nixpkgs.legacyPackages.${system};
      python = lib.head (
        pyproject-nix.lib.util.filterPythonInterpreters {
          inherit (workspace) requires-python;
          inherit (pkgs) pythonInterpreters;
        }
      );
    in
    (pkgs.callPackage pyproject-nix.build.packages {
      inherit python;
    }).overrideScope
      (
        lib.composeManyExtensions [
          pyproject-build-systems.overlays.wheel
          overlay
        ]
      );

  pkgs = nixpkgs.legacyPackages.${system};
  pythonSet = pythonSets.${system}.overrideScope overlay;
  virtualenv = pythonSet.mkVirtualEnv "${name}-env" workspace.deps.all;
in
pkgs.mkShell {
  packages = [
    virtualenv
    pkgs.uv
  ]
  ++ extraPackages;

  inherit shellHook;
}
