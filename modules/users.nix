{
  config,
  pkgs,
  lib,
  ...
}:

{
  users.users = {
    tvera = {
      shell = pkgs.nushell;
      isNormalUser = true;
      description = "Tomás Vera";
      extraGroups = [
        "networkmanager"
        "wheel"
        "lp"
      ];
    };
    bpalazzo = {
      shell = pkgs.nushell;
      isNormalUser = true;
      description = "Benjamín Palazzo";
      extraGroups = [
        "networkmanager"
        "wheel"
        "lp"
      ];
    };
  };
}
