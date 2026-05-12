{
  description = "Rust development environments";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs =
    {
      self,
      nixpkgs,
      rust-overlay,
    }:
    {
      devShells.x86_64-linux =
        let
          overlays = [ (import rust-overlay) ];
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            inherit overlays;
          };
        in
        {
          default = import ./stable.nix { inherit pkgs; };
          bevy = import ./bevy.nix { inherit pkgs; };
        };
    };
}
