{ pkgs, pkgs-self, ... }:
{
  imports = [
    ./bash
    ./foot
    # ./vscode
  ];

  home.packages = with pkgs; [
    # Make these LSPs always available, for use in neovim and otherwise.
    marksman
    lua-language-server
    nil

    # Our custom packages.
    pkgs-self.neovim
    pkgs-self.tmux
  ];
}
