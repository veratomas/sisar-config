{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    git
    unstable.zed-editor
    rust-analyzer
    uv
    nil
    ruff
    ty
    nixfmt-rfc-style
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  fonts.packages = [
    pkgs.corefonts
  ];

  # Make sure the system uses flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };

}
