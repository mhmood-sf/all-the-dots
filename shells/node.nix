{
  mkShell,
  nodejs
}:

mkShell {
  shellHook = ''
    echo "Entering Nix DevShell (lang: JavaScript, node.js)"
  '';

  packages = [
    nodejs
  ];
}
