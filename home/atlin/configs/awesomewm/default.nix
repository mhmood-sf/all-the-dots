{ pkgs, ... }:
{
  xdg.configFile."awesome" = {
    enable = true;
    recursive = true;
    source = ./dots;
  };

  # Other programs used/needed when running this WM configuration.
  imports = [
    # Custom gestures.
    (import ../touchegg { inherit pkgs; })
  ];

  # Other packages.
  home.packages = with pkgs; [
    # Enable clipboard
    xclip
  ];
}
