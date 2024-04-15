{ nixpkgs }:

nixpkgs.mkShell {
  packages = with nixpkgs; [
    ghc
    cabal-install
    zlib # Needed by cabal for package management stuff.
  ];
}
