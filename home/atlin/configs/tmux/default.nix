# TODO: See https://unix.stackexchange.com/questions/733478/how-to-remove-all-key-bindings-from-tmux-session
# TODO: for clearing all bindings. Then set your own.

{ colors, ... }:
let
  # Colors stuff
  palette = colors.palette;

  # Bash commands
  username = "whoami";
  time     = "date +%H:%M";
  battery  = "acpi | grep '\\d+%' -o";
  wifi     = "case $(nmcli | head -n 1 | grep ' connected ') in connected) echo $(nmcli | head -n 1 | grep '\\S+$' -o) ;; *) echo '-/-' ;; esac";
in {
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
      set-option -g status-left "#[bg=${colors.fg-primary},fg=${colors.bg-primary}]  #(${username}) #[bg=${colors.fg-secondary},fg=${colors.bg-secondary}] #(${time}) #[bg=default,fg=default]"
      set-option -g status-right "#[bg=${colors.fg-secondary},fg=${colors.bg-secondary}]  #(${battery}) #[bg=${colors.fg-primary},fg=${colors.bg-primary}]   #(${wifi})"
      '';
    };
  };
}
