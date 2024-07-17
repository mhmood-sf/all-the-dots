{
  mkShell,
  ghc,
  cabal-install,
  zlib
}:

mkShell {
  shellHook = ''
    echo "Entering Nix DevShell (lang: Haskell)"
    PS1="(Haskell) $PS1"
  '';

  packages = [
    ghc
    cabal-install
    zlib # Needed by cabal for package management stuff.
  ];
}
