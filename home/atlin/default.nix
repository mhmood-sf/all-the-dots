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

  # Programs & their configs (comment out a program to disable it).
  # Some programs don't have options; those are listed below
  # in `home.packages`.
  imports = [
    # Window Manager / Desktop Environment
    (import ./de/river { inherit pkgs pkgs-unstable; })

    # Work / Everyday GUI Applications
    (import ./configs/firefox { inherit pkgs; })
    (import ./configs/thunderbird { inherit pkgs; })

    # Development Tools
    (import ./configs/neovim { inherit pkgs; })
    (import ./configs/wezterm { inherit pkgs; })

    # CLI Tools & Other Utilities
    (import ./configs/gitui { inherit pkgs; })
    (import ./configs/ripgrep { inherit pkgs; })
    (import ./configs/htop { inherit pkgs; })
    (import ./configs/eza { inherit pkgs; })
    (import ./configs/flameshot { inherit pkgs; })

    # Viewing files (PDFs, images, file explorers etc.)
    (import ./configs/feh { inherit pkgs; })
    (import ./configs/zathura { inherit pkgs; })

    # Fonts
    (import ./configs/fontconfig { inherit pkgs; })

    # Misc.
    (import ./configs/bash { inherit pkgs; })
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

    # CLI Tools & Other Utilities
    fd
    slides
    qrcp
    imagemagick
    glow
    unzip
    ghostscript

    # Misc.
    ibus # Emoji
  ];

  # List of permitted insecure packages
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
}
