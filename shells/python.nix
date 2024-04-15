{
  mkShell,
  python3
}:

mkShell {
  packages = [
    (python3.withPackages (python-pkgs: [
      python-pkgs.requests
    ]))
  ];
}
