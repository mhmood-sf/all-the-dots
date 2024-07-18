{ pkgs, pkgs-self, ... }:
{
  programs.home-manager.enable = true;

  # User setup
  home = {
    username = "atlin";
    homeDirectory = "/home/atlin";
    stateVersion = "23.11";
  };

  # Shell scripts go here.
  home.file."bin" = {
    enable = true;
    recursive = true;
    source = ./scripts;
  };

  # Enable XDG base directories.
  xdg.enable = true;

  # Copy over fonts
  xdg.dataFile."fonts" = {
    enable = true;
    recursive = true;
    source = ./fonts;
  };

  # Packages and their configurations.
  imports = [
    # Window Manager / Desktop Environment
    ./de/gnome

    # Work / Everyday GUI Applications
    ./configs/firefox
    ./configs/thunderbird

    # Development Tools
    ./configs/foot
    ./configs/tmux
    ./configs/vscode
    ./configs/bash

    # CLI Tools & Other Utilities
    ./configs/eza
    ./configs/gitui
    ./configs/htop
    ./configs/ripgrep
    ./configs/yazi

    # Viewing files (PDFs, images, file explorers etc.)
    ./configs/feh
    ./configs/zathura

    # Fonts
    ./configs/fontconfig
  ];

  # Packages that don't really need any configuration.
  home.packages = with pkgs; [
    # Work / Everyday GUI Applications
    obsidian
    zoom-us

    # Development Tools
    pkgs-self.neovim

    # Graphics / Design
    gimp
    inkscape
    kdePackages.kdenlive

    # Fonts
    cascadia-code
    cm_unicode
    font-awesome
    lmmath
    noto-fonts-color-emoji
    open-sans
    # Our custom Iosevka package.
    pkgs-self.iosevka
    xits-math

    # CLI Tools & Other Utilities
    ghostscript
    glow
    imagemagick
    monolith
    qrcp
    slides
    unzip
    tree

    # Install language servers for Lua and Nix here
    # (instead of in dev shells, which is a bit annoying).
    lua-language-server
    nil
  ];

  # List of permitted insecure packages
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
}
