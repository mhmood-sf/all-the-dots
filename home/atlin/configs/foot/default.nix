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
          font = "Iosevka:style=Medium:size=13, Font Awesome 6 Free Solid:size=10, Cascadia Code NF:size=15, monospace:size=11";
          font-bold = "Iosevka:style=Heavy:size=13, Font Awesome 6 Free Solid:size=10, Cascadia Code NF:size=15, monospace:size=11";
          font-italic = "Iosevka:style=Italic:size=13, Font Awesome 6 Free Solid:size=10, Cascadia Code NF:size=15, monospace:size=11";
          font-bold-italic = "Iosevka:style=Heavy Italic:size=13, Font Awesome 6 Free Solid:size=10, Cascadia Code NF:size=15, monospace:size=11";
          pad = "7x7 center";
          bold-text-in-bright = "palette-based";
          underline-offset = "2px";
          underline-thickness = "2px";
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
