{ pkgs, ... }:
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

  # Copy over fonts
  xdg.dataFile."fonts" = {
    enable = true;
    recursive = true;
    source = ./fonts;
  };

  # Enable XDG base directories.
  xdg.enable = true;

  # Programs & their configs (comment out a program to disable it).
  # Some programs don't have options; those are listed below
  # in `home.packages`.
  imports = [
    # Window Manager / Desktop Environment
    ./de/gnome

    # Work / Everyday GUI Applications
    ./configs/firefox
    ./configs/thunderbird

    # Development Tools
    ./configs/neovim
    ./configs/foot
    ./configs/tmux
    ./configs/vscode

    # CLI Tools & Other Utilities
    ./configs/gitui
    ./configs/ripgrep
    ./configs/htop
    ./configs/eza
    ./configs/bat
    ./configs/glow

    # Viewing files (PDFs, images, file explorers etc.)
    ./configs/feh
    ./configs/zathura

    # Fonts
    ./configs/fontconfig

    # Misc.
    ./configs/bash
  ];

  # Other packages that don't really need any configuration, and
  # don't have HM options either.
  home.packages = with pkgs; [
    # Work / Everyday GUI Applications
    zoom-us
    obsidian

    # Graphics / Design
    gimp
    inkscape
    kdePackages.kdenlive

    # Fonts
    cascadia-code
    open-sans
    noto-fonts-color-emoji
    cm_unicode
    lmmath
    xits-math
    font-awesome

    # CLI Tools & Other Utilities
    slides
    qrcp
    imagemagick
    unzip
    ghostscript
    monolith

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
