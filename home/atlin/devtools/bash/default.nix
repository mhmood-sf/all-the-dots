{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = [ "ignoredups" "ignorespace" ];
    historyIgnore = [ "ls" "cd" "exit" ];
    shellAliases = {
      # Use modern equivalents.
      ls = "eza";
      grep = "rg";
      # Run mv/cp in interactive mode (ask before overwriting files).
      mv = "mv -i";
      cp = "cp -i";
    };

    initExtra = ''
      # Prompt.
      PS1='\[\e[0;0;31;5;25m\]#\[\e[0m\] '

      # Enter a nix dev shell.
      function devshell() {
        # Enter shell.
        if [ $# -ne 1 ]
        then
          echo "Usage: devshell <lang/runtime>"
        else
          nix develop /home/atlin/Source/NixOS#$1
        fi
      }

      # Add ~/bin to PATH, for some reason Nix doesn't do it automatically.
      PATH="$PATH:$HOME/bin"
    '';
  };

  # Put all our bash scripts in `~/bin`.
  home.file."bin" = {
    enable = true;
    recursive = true;
    source = ./scripts;
  };
}
