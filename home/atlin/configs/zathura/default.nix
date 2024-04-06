{ pkgs }:
{
  programs.zathura = {
    enable = true;

    # Options, mostly colors.
    options = {
      # TODO: Proper colorscheme taken as input.
      default-fg              = "#4D4872";
      default-bg              = "#EBE5DF";
      completion-fg           = "#4D4872";
      completion-bg           = "#EBE5DF";
      completion-highlight-fg = "#0C67A8";
      completion-highlight-bg = "#E5DBD1";
      completion-group-fg     = "#4D4872";
      completion-group-bg     = "#EBE5DF";
      statusbar-fg            = "#4D4872";
      statusbar-bg            = "#EBE5DF";
      inputbar-fg             = "#4D4872";
      inputbar-bg             = "#EBE5DF";
      recolor-lightcolor      = "#F6F2EE";
      recolor-darkcolor       = "#575279";
    };

    extraConfig = ''
    set smooth-scroll "true"
    set font "Open Sans 11"

    set recolor true
    '';
  };
}
