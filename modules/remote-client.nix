{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    nomachine-client
    unstable.rustdesk-flutter
  ];

}
