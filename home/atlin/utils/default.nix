{ pkgs, ... }:
{
  imports = [
    ./eza
    ./gitui
    ./htop
    ./ripgrep
  ];

  home.packages = with pkgs; [
    fzf
    ghostscript
    glow
    gnuplot
    imagemagick
    libnotify # for custom notifications
    #monolith
    qrcp
    #slides
    tree
    unzip
  ];

}
