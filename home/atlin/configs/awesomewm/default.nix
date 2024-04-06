{ pkgs }:
{
  # Enabling/disabling awesome is handled by the de file.
  # This file just handles the config file linking.

  xdg.configFile."awesome" = {
    enable = true; # TODO: Make this depend on some DE config/option that's propagated?
    recursive = true;
    source = "./dots/";
  };
}
