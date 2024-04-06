{ pkgs, ... }:
{
  fonts.fontconfig = {
    enable = true;
  };

  xdg.configFile."fontconfig" = {
    enable = true;
    recursive = true;
    source = "./dots/";
  };
}
