{ pkgs, ... }:
{
  wayland.windowManager.river = {
    enable = true;

    extraSessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
    };

    # Settings passed to riverctl.
    settings = {
      border-width = 2;

      map = {
        normal = {
          "Mod4 Return" = "wezterm";
          "Mod4 b" = "firefox";
        };
      };
    };
  };

  # Other packages needed under this DE.
  home.packages = with pkgs; [
    # Clipboard for Wayland
    wl-clipboard
  ];
}
