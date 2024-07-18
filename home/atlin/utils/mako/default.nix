{ colors, ... }:
{
  services.mako = {
    enable = true;
    anchor = "top-right";
    textColor = colors.bg-primary;
    backgroundColor = colors.fg-primary;
    progressColor = colors.accent-primary;
    borderRadius = 7;
    borderSize = 0;
    font = "Google Sans 11";
    margin = "10";
  };
}
