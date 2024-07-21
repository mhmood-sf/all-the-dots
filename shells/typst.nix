{
  mkShell,
  typst,
  typst-lsp
}:

mkShell {
  shellHook = ''
    echo "Entering Nix DevShell (lang: Typst)"
    PS1="(Typst) $PS1"
  '';

  packages = [
    typst
    typst-lsp
  ];
}
