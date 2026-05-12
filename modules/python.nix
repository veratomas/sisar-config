{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    (pkgs.python314.withPackages (
      ps: with ps; [
        python-telegram-bot
        python-dotenv
        httpx
        numpy
        h5py
        scipy
        matplotlib
        tkinter
      ]
    ))
  ];

}
