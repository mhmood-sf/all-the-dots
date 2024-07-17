{
  mkShell,
  hello
}:

mkShell {
  shellHook = ''
    echo "Entering Nix DevShell (hello)"
    PS1="(hello) $PS1"
  '';

  packages = [
    hello
  ];
}
