{ pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    # Configure keymap in X11
    layout = "us";
    xkbVariant = "";

    displayManager.gdm = {
      enable = true;
    };

    desktopManager.gnome = {
      enable = true;
    };
  };

  # Other packages needed under this DE.
  home.packages = with pkgs; [
    # Clipboard for Wayland
    wl-clipboard
  ];
}
