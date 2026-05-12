{
  description = "Modular uv2nix Python dev shells";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    pyproject-nix = {
      url = "github:pyproject-nix/pyproject.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    uv2nix = {
      url = "github:pyproject-nix/uv2nix";
      inputs.pyproject-nix.follows = "pyproject-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pyproject-build-systems = {
      url = "github:pyproject-nix/build-system-pkgs";
      inputs.pyproject-nix.follows = "pyproject-nix";
      inputs.uv2nix.follows = "uv2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      pyproject-nix,
      uv2nix,
      pyproject-build-systems,
      ...
    }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs { inherit system; };

      mkShell = import ./mkPythonUVShell.nix {
        inherit
          nixpkgs
          uv2nix
          pyproject-build-systems
          pyproject-nix
          ;
      };

      defaultShell = import ./base/base.nix {
        inherit mkShell pkgs;
      };

      sisarShell = import ./sisar/sisar.nix {
        inherit mkShell pkgs;
      };
    in
    {
      devShells.${system} = {
        default = defaultShell;
        sisar = sisarShell;
      };
    };
}
