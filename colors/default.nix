rec {
  # Just change the filename to choose a different colorscheme.
  # And then light/dark/whatever variant is available for the palette.
  colorscheme = import ./aks;
  palette = colorscheme.dark;

  # Shades
  bg-primary   = palette.shade0;
  fg-primary   = palette.shade7;
  bg-secondary = palette.shade1;
  fg-secondary = palette.shade6;

  # Black/White
  black = if palette.isDark then palette.shade0 else palette.shade7;
  white = if palette.isDark then palette.shade7 else palette.shade0;

  # Base
  red     = palette.accent0;
  orange  = palette.accent1;
  yellow  = palette.accent2;
  green   = palette.accent3;
  cyan    = palette.accent4;
  blue    = palette.accent5;
  pink    = palette.accent6;
  magenta = palette.accent7;

  # Bright Black/White
  brightblack = if palette.isDark then palette.shade1 else palette.shade6;
  brightwhite = if palette.isDark then palette.shade6 else palette.shade1;

  # Brights
  brightred     = palette.bright0;
  brightorange  = palette.bright1;
  brightyellow  = palette.bright2;
  brightgreen   = palette.bright3;
  brightcyan    = palette.bright4;
  brightblue    = palette.bright5;
  brightpink    = palette.bright6;
  brightmagenta = palette.bright7;

  # Main theme accent
  accent-primary = brightmagenta;
}
