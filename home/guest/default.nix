{ inputs, config, pkgs, ... }:
{
  programs.home-manager.enable = true;

  home = {
    username = "guest";
    homeDirectory = "/home/guest";
    # TODO: Make this "23.11" come from one source in the entire system!
    stateVersion = "23.11";

  };

  # TODO: Maybe add some packages for guest, lol?
}
