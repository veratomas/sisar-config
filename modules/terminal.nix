{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    nushell
    kitty
    xterm
    oh-my-posh
    fastfetch
  ];

  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.libertinus
  ];

}
