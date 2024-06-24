{ pkgs, ... }:
{
  programs.river = {
    enable = true;
    extraPackages = [];
  };

  # Enable XDG Desktop Portals for screensharing (and other stuff?)
  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;

      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };
  };
}
