{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    ghc
    cabal-install
    zlib # Needed by cabal for package management stuff.
  ];
}
