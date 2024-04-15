{
  mkShell,
  ghc,
  cabal-install,
  zlib
}:

mkShell {
  packages = [
    ghc
    cabal-install
    zlib # Needed by cabal for package management stuff.
  ];
}
