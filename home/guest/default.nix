{ inputs, config, pkgs, ... }:
{
  programs.home-manager.enable = true;

  home = {
    username = "guest";
    homeDirectory = "/home/guest";
    stateVersion = "23.11";

  };

  # TODO: Maybe add some packages for guest, lol?
}
