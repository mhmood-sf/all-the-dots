{
  mkShell,
  typst,
}:

mkShell {
  shellHook = ''
    echo "Entering Nix DevShell (lang: Typst)"
    PS1="(Typst) $PS1"
  '';

  packages = [
    typst
  ];
}
