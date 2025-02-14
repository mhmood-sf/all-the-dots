{ pkgs, pkgs-unstable }:
rec {
  # Languages & Runtimes.
  c       = pkgs.callPackage ./c.nix { };
  deno    = pkgs.callPackage ./deno.nix { };
  elan    = pkgs.callPackage ./elan.nix { };
  haskell = pkgs.callPackage ./haskell.nix { };
  hello   = pkgs.callPackage ./hello.nix { };
  node    = pkgs.callPackage ./node.nix { };
  python  = pkgs.callPackage ./python.nix { };
  sml     = pkgs.callPackage ./sml.nix { };
  tex     = pkgs.callPackage ./tex.nix { };
  typst   = pkgs.callPackage ./typst.nix { };

  # For testing Purposes.
  default = hello;
}
