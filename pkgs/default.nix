{ pkgs, ... }:
{
  the-nvim = pkgs.callPackage ./neovim { };
}
