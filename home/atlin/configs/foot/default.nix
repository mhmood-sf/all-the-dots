{
  config = {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          font = "Cascadia Code PL:size=10.5, Font Awesome 6 Free Solid:size=10.5, Material:size=10.5, Material Icons:size=10.5, monospace:size=10.5";
          font-bold = "Cascadia Code PL:style=Bold:size=10.5, Font Awesome 6 Free Solid:size=10.5, Material:size=10.5, Material Icons:size=10.5, monospace:size=10.5";
          font-italic = "Cascadia Code PL:style=Bold Italic:size=10.5, Font Awesome 6 Free Solid:size=10.5, Material:size=10.5, Material Icons:size=10.5, monospace:size=10.5";
          font-bold-italic = "Cascadia Code PL:style=Italic:size=10.5, Font Awesome 6 Free Solid:size=10.5, Material:size=10.5, Material Icons:size=10.5, monospace:size=10.5";
          pad = "7x7";
          bold-text-in-bright = "yes";
          line-height = "13";
        };

        colors = {
          foreground = "4D4872";
          background = "F6F2EE";
          selection-background = "BEDEDE";
          selection-foreground = "4D4872";

          regular0 = "4D4872";
          regular1 = "E9214F";
          regular2 = "07B34C";
          regular3 = "E79925";
          regular4 = "0C67A8";
          regular5 = "9335C6";
          regular6 = "16A0BE";
          regular7 = "BEDEDE";

          bright0 = "4D4872";
          bright1 = "F93D69";
          bright2 = "06DF5D";
          bright3 = "F2AB40";
          bright4 = "0784DE";
          bright5 = "AD4EDF";
          bright6 = "0DBAE0";
          bright7 = "BEDEDE";
        };
      };
    };
  };
}
