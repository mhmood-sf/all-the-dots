{ pkgs, ... }:
{
  imports = [
    ./feh
    ./zathura
  ];

  home.packages = with pkgs; [
    libreoffice
  ];
}
