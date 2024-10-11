{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gimp
    inkscape
    kdePackages.kdenlive
    krita
  ];
}
