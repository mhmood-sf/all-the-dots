{ pkgs, ... }:
{
  imports = [
    ./eza
    ./gitui
    ./htop
    ./ripgrep
    ./yazi
  ];

  home.packages = with pkgs; [
    ghostscript
    glow
    imagemagick
    monolith
    qrcp
    slides
    unzip
    tree
  ];

}
