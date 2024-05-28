# TODO: See https://unix.stackexchange.com/questions/733478/how-to-remove-all-key-bindings-from-tmux-session
# TODO: for clearing all bindings. Then set your own.

{ colors, ... }:
{
  config = {
    programs.tmux = {
      enable = true;
      clock24 = true;
      prefix = "M-Tab";
      extraConfig = ''
      # Two statuslines, the first one will be the "actual" status line,
      # and the second will serve as padding.
      set-option -g status 2
      # Update interval; higher the better
      set-option -g status-interval 60
      set-option -g status-position "top"
      set-option -g status-style bg=${colors.bg-primary},fg=${colors.fg-primary}
      # Set the second statusline to empty.
      set-option -g status-format[1] ""

      # Increase the left/right lengths so we can display all the information properly.
      set-option -g status-left-length 20
      set-option -g status-left-length 30

      set-option -g status-justify centre

      # Status lines
      set-option -g status-left "#[bg=${colors.fg-primary},fg=${colors.bg-primary}]  #(whoami) #[bg=${colors.fg-secondary},fg=${colors.bg-secondary}] #(sysinfo.sh date), #(sysinfo.sh time) #[bg=default,fg=default]"
      set-option -g status-right "#[bg=${colors.fg-secondary},fg=${colors.bg-secondary}] #(sysinfo.sh bat) #[bg=${colors.fg-primary},fg=${colors.bg-primary}] #(sysinfo.sh wifi) "
      '';
    };
  };
}
