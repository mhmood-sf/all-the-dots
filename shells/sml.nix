{
  mkShell,
  smlnj
}:

mkShell {
  shellHook = ''
    echo "Entering Nix DevShell (lang: Standard ML)"
    PS1="(SML) $PS1"
  '';

  packages = [
    smlnj
  ];
}
