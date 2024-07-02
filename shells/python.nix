{
  mkShell,
  python3
}:

mkShell {
  shellHook = ''
  echo Entering Nix DevShell (lang: Python)
  '';

  packages = [
    (python3.withPackages (python-pkgs: [
      python-pkgs.requests
    ]))
  ];
}
