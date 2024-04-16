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

      # Language development shells.
      nix-shell-c = "nix shell nixpkgs#{libgcc,gcc,gnumake,cmake,valgrind,clang-tools,gdb}";
      nix-shell-haskell = "nix shell nixpkgs#{ghc,cabal-install,zlib}";
      nix-shell-hello = "nix shell nixpkgs#hello";
      nix-shell-lean = "nix shell nixpkgs#lean4";
      nix-shell-node = "nix shell nixpkgs#nodejs";
      nix-shell-python = "echo Just use the devShell bruh...";
      nix-shell-sml = "nix shell nixpkgs#smlnj";
      nix-shell-tex = "echo Just use the devShell bruh...";
    };

    initExtra = ''
      # Prompt.
      PS1='\[\e[0;1;35;5;177m\]\u\[\e[0m\] @ \[\e[0;1;36;5;177m\]\W\[\e[0;0m\]\n\[\e[0;1;31;5;177m\]Ξ\[\e[0;90m\] \[\e[0m\]'

      # Enter a nix dev shell.
      function devshell() {
        echo Entering $1 dev shell...
        nix develop /home/atlin/Source/nixos#$1
      }

      # Add ~/bin to PATH
      PATH="$PATH:$HOME/bin"
    '';
  };
}
