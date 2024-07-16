{ pkgs, ... }:
let
  iosevka-custom = pkgs.iosevka.override {
    # From https://typeof.net/Iosevka/customizer
    privateBuildPlan = ''
      [buildPlans.Iosevka]
      family = "Iosevka"
      spacing = "term"
      serifs = "sans"
      noCvSs = true
      exportGlyphNames = false

      [buildPlans.Iosevka.variants.design]
      capital-delta = "straight"
      lower-delta = "flat-top"
      lower-lambda = "curly-tailed-turn"
      lower-chi = "semi-chancery-curly"
      asterisk = "penta-low"

        [buildPlans.Iosevka.ligations]
        inherits = "dlig"

      [buildPlans.Iosevka.weights.Regular]
      shape = 400
      menu = 400
      css = 400

      [buildPlans.Iosevka.weights.Medium]
      shape = 500
      menu = 500
      css = 500

      [buildPlans.Iosevka.weights.SemiBold]
      shape = 600
      menu = 600
      css = 600

      [buildPlans.Iosevka.weights.Bold]
      shape = 700
      menu = 700
      css = 700

      [buildPlans.Iosevka.weights.ExtraBold]
      shape = 800
      menu = 800
      css = 800

      [buildPlans.Iosevka.weights.Heavy]
      shape = 900
      menu = 900
      css = 900

      [buildPlans.Iosevka.slopes.Upright]
      angle = 0
      shape = "upright"
      menu = "upright"
      css = "normal"

      [buildPlans.Iosevka.slopes.Italic]
      angle = 9.4
      shape = "italic"
      menu = "italic"
      css = "italic"
    '';
  };
in
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
    ./configs/foot
    ./configs/neovim
    ./configs/tmux
    ./configs/vscode

    # CLI Tools & Other Utilities
    ./configs/bat
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

    # Misc.
    ./configs/bash
  ];

  # Other packages that don't really need any configuration, and
  # don't have HM options either.
  home.packages = with pkgs; [
    # Work / Everyday GUI Applications
    obsidian
    zoom-us

    # Graphics / Design
    gimp
    inkscape
    kdePackages.kdenlive

    # Fonts
    cascadia-code
    cm_unicode
    font-awesome
    iosevka-custom
    lmmath
    noto-fonts-color-emoji
    open-sans
    xits-math

    # CLI Tools & Other Utilities
    ghostscript
    glow
    imagemagick
    monolith
    qrcp
    slides
    unzip

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
