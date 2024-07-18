{ pkgs, pkgs-self, ... }:
{
  imports = [
    ./foot
    ./tmux
    ./vscode
    ./bash
  ];

  home.packages = with pkgs; [
    # Make these LSPs always available, for use in neovim and otherwise.
    lua-language-server
    nil

    # Our custom neovim package.
    pkgs-self.neovim
  ];
}
