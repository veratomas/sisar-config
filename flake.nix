{
  description = "My NixOS configuration (flake-based)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11"; # pick a channel
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    zen-browser.url = "github:youwen5/zen-browser-flake";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      pkgs-unstable = import inputs.nixpkgs-unstable { inherit system; };
    in
    {

      nixosConfigurations = {
        sisar1 = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/sisar1
          ];
        };
      };
    };
}
