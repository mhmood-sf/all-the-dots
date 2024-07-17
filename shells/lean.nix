{
  mkShell,
  lean4
}:

mkShell {
  shellHook = ''
    echo "Entering Nix DevShell (lang: Lean)"
    PS1="(Lean) $PS1"
  '';

  packages = [
    lean4
  ];
}
