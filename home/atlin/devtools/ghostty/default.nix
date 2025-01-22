{ colors, ... }:
let
  # '#RRGGBB' -> 'RRGGBB'
  getColor = clr: (builtins.substring 1 (builtins.stringLength clr) clr);
  palette-dark = colors.colorscheme.dark;
  palette-light = colors.colorscheme.light;
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
      theme = "dark:nixos-ghostty-theme-dark,light:nixos-ghostty-theme-light";
    };
    themes = {
      nixos-ghostty-theme-dark = {
        # Bold font uses bright colors.
        bold-is-bright = true;
        cursor-color = getColor palette-dark.accent5;
        # Just copy over the color scheme.
        foreground = getColor palette-dark.shade7;
        background = getColor palette-dark.shade0;
        selection-background = getColor palette-dark.aux0;
        selection-foreground = getColor palette-dark.shade7;
        palette = [
          "0=${palette-dark.shade0}"
          "1=${palette-dark.accent0}"
          "2=${palette-dark.accent3}"
          "3=${palette-dark.accent1}"
          "4=${palette-dark.accent5}"
          "5=${palette-dark.accent7}"
          "6=${palette-dark.accent4}"
          "7=${palette-dark.shade7}"
          "8=${palette-dark.shade1}"
          "9=${palette-dark.bright0}"
          "10=${palette-dark.bright3}"
          "11=${palette-dark.bright1}"
          "12=${palette-dark.bright5}"
          "13=${palette-dark.bright7}"
          "14=${palette-dark.bright4}"
          "15=${palette-dark.shade6}"
        ];
      };

      nixos-ghostty-theme-light = {
        # Bold font uses bright colors.
        bold-is-bright = true;
        cursor-color = getColor palette-light.accent5;
        # Just copy over the color scheme.
        foreground = getColor palette-light.shade7;
        background = getColor palette-light.shade0;
        selection-background = getColor palette-light.aux0;
        selection-foreground = getColor palette-light.shade7;
        palette = [
          "0=${palette-light.shade7}"
          "1=${palette-light.accent0}"
          "2=${palette-light.accent3}"
          "3=${palette-light.accent1}"
          "4=${palette-light.accent5}"
          "5=${palette-light.accent7}"
          "6=${palette-light.accent4}"
          "7=${palette-light.shade0}"
          "8=${palette-light.shade6}"
          "9=${palette-light.bright0}"
          "10=${palette-light.bright3}"
          "11=${palette-light.bright1}"
          "12=${palette-light.bright5}"
          "13=${palette-light.bright7}"
          "14=${palette-light.bright4}"
          "15=${palette-light.shade1}"
        ];
      };
    };
  };
}
