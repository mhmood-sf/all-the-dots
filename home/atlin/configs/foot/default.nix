{ colors, ... }:
let
  # '#RRGGBB' -> 'RRGGBB'
  getColor = clr: (builtins.substring 1 (builtins.stringLength clr) clr);
  palette = colors.palette;
in {
  config = {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          font = "Cascadia Code PL:size=10.5, Font Awesome 6 Free Solid:size=8, Material:size=9, Material Icons:size=9, monospace:size=10";
          font-bold = "Cascadia Code PL:style=Bold:size=10.5, Font Awesome 6 Free Solid:size=8, Material:size=9, Material Icons:size=9, monospace:size=10";
          font-italic = "Cascadia Code PL:style=Bold Italic:size=10.5, Font Awesome 6 Free Solid:size=8, Material:size=9, Material Icons:size=9, monospace:size=10";
          font-bold-italic = "Cascadia Code PL:style=Italic:size=10.5, Font Awesome 6 Free Solid:size=8, Material:size=9, Material Icons:size=9, monospace:size=10";
          pad = "7x7";
          bold-text-in-bright = "palette-based";
          line-height = "13";
        };

        colors = {
          foreground = getColor colors.fg-primary;
          background = getColor colors.bg-primary;
          selection-background = getColor palette.aux0;

          regular0 = getColor colors.black;
          regular1 = getColor colors.red;
          regular2 = getColor colors.green;
          regular3 = getColor colors.orange;
          regular4 = getColor colors.blue;
          regular5 = getColor colors.magenta;
          regular6 = getColor colors.cyan;
          regular7 = getColor colors.white;

          bright0 = getColor colors.brightblack;
          bright1 = getColor colors.brightred;
          bright2 = getColor colors.brightgreen;
          bright3 = getColor colors.brightorange;
          bright4 = getColor colors.brightblue;
          bright5 = getColor colors.brightmagenta;
          bright6 = getColor colors.brightcyan;
          bright7 = getColor colors.brightwhite;
        };
      };
    };
  };
}
