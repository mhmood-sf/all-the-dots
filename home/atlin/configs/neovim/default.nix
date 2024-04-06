{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
    withNodeJs = false;
  };

  xdg.configFile."nvim" = {
    enable = true;
    recursive = true;
    source = "./dots/";
  };
}
