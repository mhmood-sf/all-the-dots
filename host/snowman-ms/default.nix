{ config, pkgs, ... }:
{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix

    # Desktop Env / Window Manager
    ../../de/gnome
  ];
}
