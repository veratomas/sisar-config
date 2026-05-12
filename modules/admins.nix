{
  config,
  pkgs,
  lib,
  ...
}:

{
  users.users = {
    sisar = {
      shell = pkgs.nushell;
      isNormalUser = true;
      description = "SISAR";
      extraGroups = [
        "networkmanager"
        "wheel"
        "lp"
        "docker"
      ];
    };
  };
}
