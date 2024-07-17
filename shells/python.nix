{
  mkShell,
  python3
}:

mkShell {
  shellHook = ''
    echo "Entering Nix DevShell (lang: Python)"
    PS1="(Python) $PS1"
  '';

  packages = [
    (python3.withPackages (python-pkgs: [
      python-pkgs.requests
    ]))
  ];
}
