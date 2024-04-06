{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = [ "ignoredups" "ignorespace" ];
    historyIgnore = [ "ls" "cd" "exit" ];
    shellAliases = {
      # Enable color.
      ls = "ls --color=auto";
      grep = "grep --color=auto";
      # Run mv/cp in interactive mode (ask before overwriting files).
      mv = "mv -i";
      cp = "cp -i";
    };

    initExtra = ''
      # Check the window size after each command and, if necessary,
      # update the values of LINES and COLUMNS.
      shopt -s checkwinsize

      # Append to the history file, don't overwrite it.
      shopt -s histappend

      # If set, the pattern "**" used in a pathname expansion context will
      # match all files and zero or more directories and subdirectories.
      shopt -s globstar

      # Prompt.
      PS1='\[\e[0;1;35;5;177m\]\u\[\e[0m\] @ \[\e[0;1;36;5;177m\]\W\[\e[0;0m\]\n\[\e[0;1;31;5;177m\]Ξ\[\e[0;90m\] \[\e[0m\]'
    '';
  };
}
