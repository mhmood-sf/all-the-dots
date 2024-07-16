{ pkgs, ... }:
let
  iosevka-term = pkgs.iosevka.override {
    set = "Term";
    # See https://typeof.net/Iosevka/customizer
    privateBuildPlan = ''
      [buildPlans.IosevkaTerm]
      family = "Iosevka"
      spacing = "term"
      serifs = "sans"
      noCvSs = true
      exportGlyphNames = false

      [buildPlans.IosevkaTerm.variants.design]
      capital-delta = "straight"
      lower-delta = "flat-top"
      lower-lambda = "curly-tailed-turn"
      lower-chi = "semi-chancery-curly"
      asterisk = "penta-low"

        [buildPlans.IosevkaTerm.ligations]
        inherits = "dlig"

      [buildPlans.IosevkaTerm.weights.Regular]
      shape = 400
      menu = 400
      css = 400

      [buildPlans.IosevkaTerm.weights.Medium]
      shape = 500
      menu = 500
      css = 500

      [buildPlans.IosevkaTerm.weights.SemiBold]
      shape = 600
      menu = 600
      css = 600

      [buildPlans.IosevkaTerm.weights.Heavy]
      shape = 900
      menu = 900
      css = 900

      [buildPlans.IosevkaTerm.slopes.Upright]
      angle = 0
      shape = "upright"
      menu = "upright"
      css = "normal"

      [buildPlans.IosevkaTerm.slopes.Italic]
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
    iosevka-term
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
