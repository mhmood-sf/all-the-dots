{ nixpkgs }:

nixpkgs.mkShell {
  packages = with nixpkgs; [
    smlnj
  ];
}
