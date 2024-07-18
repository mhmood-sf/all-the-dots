{ pkgs, ... }:
{
  # Other packages needed under this DE.
  home.packages = with pkgs; [
    # Clipboard for Wayland
    wl-clipboard
  ];
}
