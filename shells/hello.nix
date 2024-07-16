{
  mkShell,
  hello
}:

mkShell {
  shellHook = ''
    echo "Entering Nix DevShell (hello)"
  '';

  packages = [
    hello
  ];
}
