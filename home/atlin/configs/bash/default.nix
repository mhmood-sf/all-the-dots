{
  config = {
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
        PS1='\[\e[0;1;35;5;25m\]\u\[\e[0m\] @ \[\e[0;1;36;5;25m\]\W\[\e[0;0m\]\n\[\e[0;1;31;5;25m\]$\[\e[0m\] '

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

        # Add ~/bin to PATH
        PATH="$PATH:$HOME/bin"
      '';
    };
  };
}
