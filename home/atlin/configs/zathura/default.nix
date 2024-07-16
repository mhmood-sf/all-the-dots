{ colors, ... }:
{
  config = {
    programs.zathura = {
      enable = true;
      options = {
        default-fg              = colors.fg-primary;
        default-bg              = colors.bg-primary;
        completion-fg           = colors.fg-secondary;
        completion-bg           = colors.bg-secondary;
        completion-highlight-fg = colors.accent-primary;
        completion-highlight-bg = colors.bg-secondary;
        completion-group-fg     = colors.fg-secondary;
        completion-group-bg     = colors.bg-secondary;
        statusbar-fg            = colors.fg-secondary;
        statusbar-bg            = colors.bg-secondary;
        inputbar-fg             = colors.fg-secondary;
        inputbar-bg             = colors.bg-secondary;
        recolor-lightcolor      = colors.white;
        recolor-darkcolor       = colors.black;
      };

      extraConfig = ''
        set smooth-scroll "true"
        set font "Google Sans 11"

        set recolor true
      '';
    };
  };
}
