{ nixpkgs }:
{
  c       = (import ./c.nix { inherit nixpkgs; });
  haskell = (import ./haskell.nix { inherit nixpkgs; });
  lean    = (import ./lean.nix { inherit nixpkgs; });
  node    = (import ./node.nix { inherit nixpkgs; });
  python  = (import ./python.nix { inherit nixpkgs; });
  sml     = (import ./sml.nix { inherit nixpkgs; });
  tex     = (import ./tex.nix { inherit nixpkgs; });
}
