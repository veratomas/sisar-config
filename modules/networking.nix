{
  config,
  pkgs,
  lib,
  ...
}:

{
  networking.networkmanager.enable = true;

  # Firewall enabled but open ssh
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
  };
}
