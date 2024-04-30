{ pkgs, ... }:
{
  # Other packages needed with this DE.
  imports = [
    # Notifications
    ../../configs/mako

    # Launcher.
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

    # Other packages needed under this DE, that don't need configuration
    # and don't have HM options available.
    home.packages = with pkgs; [
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

      # Send custom notifications
      libnotify

      # GUI File Explorer
      xfce.thunar

      # Clipboard for Wayland
      wl-clipboard
    ];
  };
}
