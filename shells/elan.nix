{
  mkShell,
  elan
}:

mkShell {
  shellHook = ''
    echo "Entering Nix DevShell (elan)"
    PS1="(elan) $PS1"
  '';

  packages = [
    elan
  ];
}
