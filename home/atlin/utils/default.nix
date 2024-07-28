{ pkgs, ... }:
{
  imports = [
    ./eza
    ./gitui
    ./htop
    ./ripgrep
    ./yazi
    ./zk
  ];

  home.packages = with pkgs; [
    ascii-image-converter
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
