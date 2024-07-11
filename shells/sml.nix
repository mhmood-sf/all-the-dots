{
  mkShell,
  smlnj
}:

mkShell {
  shellHook = ''
  echo "Entering Nix DevShell (lang: Standard ML)"
  '';

  packages = [
    smlnj
  ];
}
