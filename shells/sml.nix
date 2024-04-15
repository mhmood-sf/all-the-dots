{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    smlnj
  ];
}
