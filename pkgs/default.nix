{ pkgs, colors, ... }:
{
  neovim = pkgs.callPackage ./neovim { };
  iosevka = pkgs.callPackage ./iosevka { };
  tmux = pkgs.callPackage ./tmux { inherit colors; };
}
