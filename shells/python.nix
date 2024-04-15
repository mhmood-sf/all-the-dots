{ nixpkgs }:

nixpkgs.mkShell {
  packages = with nixpkgs; [
    (python3.withPackages (python-pkgs: [
      python-pkgs.requests
    ]))
  ];
}
