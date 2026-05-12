{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/clitools.nix
    ../../modules/common.nix
    ../../modules/plasma6.nix
    ../../modules/networking.nix
    ../../modules/terminal.nix
    ../../modules/office.nix
    ../../modules/admins.nix
    ../../modules/users.nix
    ../../modules/postgresql.nix
    ../../modules/sotware.nix
    ../../modules/python.nix
    ../../modules/rust.nix
    ../../modules/remote-client.nix
    ../../modules/unstable.nix
  ];
  networking.hostName = "sisar1";

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = [ "sisar" ];
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "America/Argentina/Buenos_Aires";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_AR.UTF-8";
    LC_IDENTIFICATION = "es_AR.UTF-8";
    LC_MEASUREMENT = "es_AR.UTF-8";
    LC_MONETARY = "es_AR.UTF-8";
    LC_NAME = "es_AR.UTF-8";
    LC_NUMERIC = "es_AR.UTF-8";
    LC_PAPER = "es_AR.UTF-8";
    LC_TELEPHONE = "es_AR.UTF-8";
    LC_TIME = "es_AR.UTF-8";
  };

  system.stateVersion = "25.11";
}
