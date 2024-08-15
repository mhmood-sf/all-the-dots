{
  mkShell,
  lean4
}:

mkShell {
  shellHook = ''
    echo "Entering Nix DevShell (lang: Lean)"
    echo "Note: For more up-to-date versions of Lean, consider using elan instead of nixpkgs."
    PS1="(Lean) $PS1"
  '';

  packages = [
    lean4
  ];
}
