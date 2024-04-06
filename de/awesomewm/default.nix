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

    windowManager.awesome = {
      enable = true;
    };
  };

  # Enable gestures
  services.touchegg.enable = true;
}
