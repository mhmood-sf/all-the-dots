{ pkgs, ... }:
{
  programs.home-manager.enable = true;

  # User setup
  home = {
    username = "atlin";
    homeDirectory = "/home/atlin";
    stateVersion = "23.11";
  };

  # Enable XDG base directories.
  xdg.enable = true;

  # Modules containing packages and their configurations.
  imports = [
    # Window manager / desktop environment.
    ./de
    # Terminal, editors, etc.
    ./devtools
    # Office suite, PDF/image viewer, etc.
    ./documents
    # Self-explanatory.
    ./fonts
    # Web Browser, Email, RSS, IRC, etc.
    ./internet
    # GIMP, Inkscape, Music Player, etc.
    ./multimedia
    # Various utilities (command line tools, launchers, gestures, etc.)
    ./utils
  ];

  # Misc. packages (including temporary ones e.g. for school).
  home.packages = with pkgs; [
    zoom-us
  ];

  # List of permitted insecure packages
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
}
