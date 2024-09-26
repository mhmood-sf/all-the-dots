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
    # Self-explanatory.
    ./fonts
    # GIMP, Inkscape, etc.
    ./graphics
    # Firefox and Thunderbird.
    ./mozilla
    # Various utilities (command line tools, launchers, gestures, etc.)
    ./utils
    # Office suite, PDF/image viewer, etc.
    ./office
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
