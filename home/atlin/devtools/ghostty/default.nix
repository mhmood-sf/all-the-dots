{ colors, ... }:
let
  # '#RRGGBB' -> 'RRGGBB'
  getColor = clr: (builtins.substring 1 (builtins.stringLength clr) clr);
  palette = colors.palette;
in {
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = [
        "Iosevka"
        "Font Awesome 6 Free Solid"
        "Cascadia Code NF"
      ];

      font-family-bold = [
        "Iosevka"
        "Font Awesome 6 Free Solid"
        "Cascadia Code NF"
      ];

      font-family-italic = [
        "Iosevka"
        "Font Awesome 6 Free Solid"
        "Cascadia Code NF"
      ];

      font-family-bold-italic = [
        "Iosevka"
        "Font Awesome 6 Free Solid"
        "Cascadia Code NF"
      ];

      font-style = "Medium";
      font-style-bold = "Extrabold";
      font-style-italic = "Medium Italic";
      font-style-bold-italic = "Extrabold Italic";

      # Bigger cell height, with the font centered in the middle, and the
      # cursor adjusted to the cell's height.
      adjust-cell-height = 5;
      adjust-cursor-height = 5;
      adjust-font-baseline = -1;

      # Thicker underlines.
      adjust-underline-position = 2;
      adjust-underline-thickness = 2;

      # Slightly thicker bar cursor.
      adjust-cursor-thickness = 2;
      # Default cursor style, with no blinking.
      cursor-style = "block";
      cursor-style-blink = false;
      # For some reason, shell integration interferes with cursor style.
      shell-integration = "none";

      # Allow window decorations (looks decent enough on GNOME, turn off
      # when using a window manager with no desktop environment).
      window-decoration = true;

      # Add window padding, where the padded area is colored based on
      # the current color of the neighbouring cells. Works well when using
      # TUIs with a different background color.
      window-padding-color = "extend";
      window-padding-x = "7";
      window-padding-y = "7";

      # We'll create the theme based on the colors provided by the nix config.
      theme = "nixos-ghostty-theme";
    };
    themes = {
      nixos-ghostty-theme = {
        # Bold font uses bright colors.
        bold-is-bright = true;
        cursor-color = getColor colors.blue;
        # Just copy over the color scheme.
        foreground = getColor colors.fg-primary;
        background = getColor colors.bg-primary;
        selection-background = getColor palette.aux0;
        selection-foreground = getColor colors.fg-primary;
        palette = [
          "0=${colors.black}"
          "1=${colors.red}"
          "2=${colors.green}"
          "3=${colors.orange}"
          "4=${colors.blue}"
          "5=${colors.magenta}"
          "6=${colors.cyan}"
          "7=${colors.white}"
          "8=${colors.brightblack}"
          "9=${colors.brightred}"
          "10=${colors.brightgreen}"
          "11=${colors.brightorange}"
          "12=${colors.brightblue}"
          "13=${colors.brightmagenta}"
          "14=${colors.brightcyan}"
          "15=${colors.brightwhite}"
        ];
      };
    };
  };
}
