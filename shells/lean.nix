{ nixpkgs }:

nixpkgs.mkShell {
  packages = with nixpkgs; [
    lean4
  ];
}
