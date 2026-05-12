{
  config,
  pkgs,
  lib,
  ...
}:

{
  config.services.postgresql = {
    enable = true;
    ensureDatabases = [ "sisar" ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
    '';
  };

  # In /etc/nixos/configuration.nix
  config.virtualisation.docker = {
    enable = true;
  };

}
