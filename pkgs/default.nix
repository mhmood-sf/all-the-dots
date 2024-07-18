{ pkgs, ... }:
{
  neovim = pkgs.callPackage ./neovim { };
  iosevka = pkgs.callPackage ./iosevka { };
}
