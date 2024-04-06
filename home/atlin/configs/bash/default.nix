{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = [ "ignoredups" "ignorespace" ];
    historyIgnore = [ "ls" "cd" "exit" ];
    shellAliases = {
      # Enable color.
      ls = "eza";
      grep = "rg";
      # Run mv/cp in interactive mode (ask before overwriting files).
      mv = "mv -i";
      cp = "cp -i";
    };

    initExtra = ''
      # Prompt.
      PS1='\[\e[0;1;35;5;177m\]\u\[\e[0m\] @ \[\e[0;1;36;5;177m\]\W\[\e[0;0m\]\n\[\e[0;1;31;5;177m\]Ξ\[\e[0;90m\] \[\e[0m\]'
    '';
  };
}
