{
  mkShell,
  deno
}:

mkShell {
  shellHook = ''
    echo "Entering Nix DevShell (lang: TypeScript, deno)"
    PS1="(deno) $PS1"
  '';

  packages = [
    deno
  ];
}
