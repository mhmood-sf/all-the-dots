{
  mkShell,
  ghc,
  cabal-install,
  zlib
}:

mkShell {
  shellHook = ''
    echo "Entering Nix DevShell (lang: Haskell)"
  '';

  packages = [
    ghc
    cabal-install
    zlib # Needed by cabal for package management stuff.
  ];
}
