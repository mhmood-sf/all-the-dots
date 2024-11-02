{ pkgs, pkgs-self, ... }:
{
  imports = [
    ./foot
    # ./vscode
    ./bash
  ];

  home.packages = with pkgs; [
    # Make these LSPs always available, for use in neovim and otherwise.
    markdown-oxide
    lua-language-server
    nil

    # Our custom packages.
    pkgs-self.neovim
    # pkgs-self.tmux
  ];
}
