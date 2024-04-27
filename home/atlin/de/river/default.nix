{ pkgs, ... }:
{
  # Other packages needed with this DE (enabled through HM).
  imports = [
    # Notifications
    ../../configs/mako

    # Launcher (currently just the config, since there's no HM
    # option to enable it).
    ../../configs/tofi

    # Bar config
    ../../configs/yambar
  ];

  config = {
    xdg.configFile."river" = {
      enable = true;
      recursive = true;
      source = ./dots;
    };

    # Set the wallpaper in the home directory.
    home.file.".wallpaper.png" = {
      source = ./dots/.wallpaper.png;
    };

    # Other packages needed under this DE.
    home.packages = with pkgs; [
      # Launcher (remove after updating HM and using it's enable option).
      tofi

      # Screenshots
      wayshot
      slurp

      # Brightness / backlight / night light
      light
      wlsunset

      # Wallpaper
      wbg
      pixman
      libpng

      # Screenlock
      waylock

      # Bar
      yambar

      # Send custom notifications
      libnotify

      # File Explorer
      xfce.thunar

      # Clipboard for Wayland
      wl-clipboard
    ];
  };
}
