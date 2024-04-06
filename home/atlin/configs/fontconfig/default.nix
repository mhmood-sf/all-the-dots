{ pkgs }:
{
  fonts.fontconfig = {
    enable = true;
    hinting.enable = false;
    defaultFonts = {
      serif = "Open Sans";
      sansSerif = "Palatino Linotype";
      monospace = "Cascadia Code PL";
    };
  };

  xdg.configFile."fontconfig" = {
    enable = true;
    recursive = true;
    source = "./dots/";
  };
}
