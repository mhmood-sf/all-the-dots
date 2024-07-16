{
  mkShell,
  lean4
}:

mkShell {
  shellHook = ''
    echo "Entering Nix DevShell (lang: Lean)"
  '';

  packages = [
    lean4
  ];
}
