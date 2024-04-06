{ pkgs, ... }:
{
  programs.wezterm = {
    enable = true;
  };

  xdg.configFile."wezterm" = {
    enable = true;
    recursive = true;
    source = ./dots;
  };
}
