{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.atlin = {
    home.stateVersion = "23.11";
    home.packages = with pkgs; [
      # Work/GUI Applications
      firefox
      thunderbird
      zoom-us
      logisim-evolution # TODO: Remove after CSC258
      obsidian

      # CLI Tools
      gitui
      ripgrep
      fd
      slides
      qrcp
      htop
      imagemagick

      # PDF Editing/Viewing/etc. (see shells/ for texlive)
      zathura
      ghostscript

      # Development Tools
      wezterm
      neovim

      # Personalization / Themes
      cascadia-code

      # Misc.
      wl-clipboard # Clipboard for Wayland
    ];

    # For properly handling/loading fonts, etc.
    fonts.fontconfig.enable = true;
  };

  # List of permitted insecure packages
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
}
