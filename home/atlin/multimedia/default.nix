{ pkgs, ... }:
{
  home.packages = with pkgs; [
    amberol
    gimp
    inkscape
    #kdePackages.kdenlive
    krita
  ];
}
