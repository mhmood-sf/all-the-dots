{ pkgs, ... }:
{
  xdg.configFile."touchegg" = {
    enable = true;
    recursive = true;
    source = ./dots;
  };
}
