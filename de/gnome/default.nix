{ pkgs, ... }:
{
  # Enable the X11 windowing system (except not
  # really, it's actually just to enable GNOME,
  # which then uses wayland under the hood).
  services.xserver = {
    enable = true;

    # Configure XKB
    xkb = {
      layout = "us";
      variant = "";
    };

    displayManager.gdm = {
      enable = true;
    };

    desktopManager.gnome = {
      enable = true;
    };
  };
}
