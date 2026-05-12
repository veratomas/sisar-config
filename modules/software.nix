{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    python314
    obsidian
    typst
    tinymist
  ];

}
