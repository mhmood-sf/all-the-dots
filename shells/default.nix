{ pkgs, pkgs-unstable }:
rec {
  # Languages & Runtimes.
  c       = pkgs.callPackage ./c.nix { };
  haskell = pkgs.callPackage ./haskell.nix { };
  hello   = pkgs.callPackage ./hello.nix { };
  lean    = pkgs.callPackage ./lean.nix { };
  node    = pkgs.callPackage ./node.nix { };
  python  = pkgs.callPackage ./python.nix { };
  sml     = pkgs.callPackage ./sml.nix { };
  tex     = pkgs.callPackage ./tex.nix { };
  typst   = pkgs.callPackage ./typst.nix { };

  # Unstable version (for the latest packages)
  lean-unstable    = pkgs-unstable.callPackage ./lean.nix { };

  # For testing Purposes.
  default = hello;
}
