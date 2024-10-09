{ pkgs, pkgs-self, ... }:

{
  imports = [
    ./fontconfig
  ];

  home.packages = with pkgs; [
    cascadia-code
    cm_unicode
    font-awesome
    lmmath
    noto-fonts-color-emoji
    open-sans
    xits-math

    # Our custom Iosevka package.
    pkgs-self.iosevka
  ];

  # Copy over font files.
  xdg.dataFile."fonts/ttf" = {
    enable = true;
    recursive = true;
    source = ./ttf;
  };
}
