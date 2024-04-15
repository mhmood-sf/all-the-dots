{ pkgs, ... }:
{
  c       = (import ./c.nix { inherit pkgs; });
  haskell = (import ./haskell.nix { inherit pkgs; });
  lean    = (import ./lean.nix { inherit pkgs; });
  node    = (import ./node.nix { inherit pkgs; });
  python  = (import ./python.nix { inherit pkgs; });
  sml     = (import ./sml.nix { inherit pkgs; });
  tex     = (import ./tex.nix { inherit pkgs; });
}
