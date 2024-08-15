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
    fzf
    ghostscript
    glow
    imagemagick
    libnotify # for custom notifications
    monolith
    qrcp
    slides
    tree
    unzip
  ];

}
