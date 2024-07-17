{
  mkShell,
  nodejs
}:

mkShell {
  shellHook = ''
    echo "Entering Nix DevShell (lang: JavaScript, node.js)"
    PS1="(node.js) $PS1"
  '';

  packages = [
    nodejs
  ];
}
