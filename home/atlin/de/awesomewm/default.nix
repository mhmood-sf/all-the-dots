{ pkgs, ... }:
{
  services.xserver = {
    enable = true;

    # Configure keymap in X11
    layout = "us";
    xkbVariant = "";

    # Touchpad stuff.
    libinput = {
      enable = true;
      touchpad = {
        tapping = true;
        naturalScrolling = true;
      };
    };

    # No display manager, use startx to run awesomewm.
    displayManager = {
      defaultSession = "none+awesome";
      startx.enable = true;
    };

    # Enable awesome, but leave the rest of the config to home manager.
    windowManager.awesome = {
      enable = true;
    };
  };

  xdg.configFile."awesome" = {
    enable = true;
    recursive = true;
    source = ./dots;
  };

  # Other programs used/needed when running this WM configuration.
  imports = [
    # Custom gestures.
    (import ../../configs/touchegg { inherit pkgs; })
  ]

  # Other packages.
  home.packages = with pkgs; [
    # Enable clipboard
    xclip
  ]
}
