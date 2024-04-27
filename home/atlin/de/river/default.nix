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

    # Always use night mode, through wlsunset.
    services.wlsunset = {
      enable = true;
      gamma = "0.5";
      # Toronto
      latitude = "43.65";
      longitude = "79.38";
      temperature = {
        day = 4000;
        night = 4000;
      };
    };

    # Other packages needed under this DE.
    home.packages = with pkgs; [
      # Launcher (remove after updating HM and using it's enable option).
      tofi

      # Screenshots
      wayshot
      slurp

      # Brightness / backlight
      light

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

      # Clipboard for Wayland
      wl-clipboard
    ];
  };
}
