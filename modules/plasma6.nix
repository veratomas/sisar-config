{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  services.xserver.enable = false;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
  ];

  # Enable sound
  services.pulseaudio.enable = false; # using pipewire instead
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
