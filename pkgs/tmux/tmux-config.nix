{ colors, writeTextFile }:
writeTextFile {
  name = "tmux-config";
  text = ''
    set  -g default-terminal "screen"
    set  -g base-index      0
    setw -g pane-base-index 0

    set -g status-keys emacs
    set -g mode-keys   emacs

    # Rebind main key: M-Tab
    unbind C-b
    set -g prefix M-Tab
    bind -N "Send the prefix key through to the application" \
      M-Tab send-prefix

    set  -g mouse             off
    setw -g aggressive-resize off
    setw -g clock-mode-style  24
    set  -s escape-time       500
    set  -g history-limit     2000

    # Update interval; higher the better
    set-option -g status-interval 60
    set-option -g status-position "top"
    set-option -g status-style bg=${colors.bg-primary},fg=${colors.fg-primary}

    # Increase the left/right lengths so we can display all the information properly.
    set-option -g status-left-length 20
    set-option -g status-left-length 30

    set-option -g status-justify centre

    # Status lines
    set-option -g status-left "#[bg=${colors.fg-primary},fg=${colors.bg-primary}]  #(whoami) #[bg=${colors.fg-secondary},fg=${colors.bg-secondary}] #(sysinfo.sh date), #(sysinfo.sh time) #[bg=default,fg=default]"
    set-option -g status-right "#[bg=${colors.fg-secondary},fg=${colors.bg-secondary}] #(sysinfo.sh bat) #[bg=${colors.fg-primary},fg=${colors.bg-primary}] #(sysinfo.sh wifi) "
  '';
}
