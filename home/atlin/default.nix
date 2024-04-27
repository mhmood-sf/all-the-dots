{ pkgs, pkgs-unstable, ... }:
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

  # Set the cursor theme.
  home.pointerCursor = {
    name = "Graphite light Cursors";
    package = pkgs.graphite-cursors;
    gtk.enable = true;
  };

  # Programs & their configs (comment out a program to disable it).
  # Some programs don't have options; those are listed below
  # in `home.packages`.
  imports = [
    # Window Manager / Desktop Environment
    ./de/river

    # Work / Everyday GUI Applications
    ./configs/firefox
    ./configs/thunderbird

    # Development Tools
    ./configs/neovim
    ./configs/wezterm

    # CLI Tools & Other Utilities
    ./configs/gitui
    ./configs/ripgrep
    ./configs/htop
    ./configs/eza
    ./configs/bat

    # Viewing files (PDFs, images, file explorers etc.)
    ./configs/feh
    ./configs/zathura

    # Fonts
    ./configs/fontconfig

    # Misc.
    ./configs/bash
  ];

  # Other packages (fonts, other stuff)
  home.packages = with pkgs; [
    # Work / Everyday GUI Applications
    zoom-us
    obsidian

    # Fonts
    cascadia-code
    open-sans
    noto-fonts-color-emoji
    cm_unicode
    lmmath
    xits-math
    font-awesome

    # CLI Tools & Other Utilities
    fd
    slides
    qrcp
    imagemagick
    glow
    unzip
    ghostscript
    monolith

    # Misc.
    ibus # Emojis. TODO: Does this even work properly on wayland?
  ];

  # List of permitted insecure packages
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
}
