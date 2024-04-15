{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    lean4
  ];
}
