{ pkgs, ... }:
{
  programs.home-manager.enable = true;

  home = {
    username = "atlin";
    homeDirectory = "/home/atlin";
    stateVersion = "23.11";
  };

  # Enable XDG base directories.
  xdg.enable = true;

  # Programs & their configs (comment out a program to disable it).
  # Some programs don't offer any nix options; those are listed below
  # in `home.packages`.
  imports = [
    # Window Manager (comment out if using a different one).
    # (import ./configs/awesomewm { inherit pkgs; })
    # Custom gestures (probably comment out if using a DE instead of WM).
    # (import ./configs/touchegg { inherit pkgs; })

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
    logisim-evolution # TODO: Remove after end of semester.
    mars-mips # TODO: Remove after end of semester.
    obsidian

    # Fonts
    cascadia-code
    open-sans
    noto-fonts-color-emoji

    # CLI Tools & Other Utilities
    fd
    slides
    qrcp
    imagemagick
    glow
    unzip
    ghostscript

    # Misc.
    wl-clipboard # Clipboard for Wayland
    ibus # Emoji
  ];


  # List of permitted insecure packages
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
}