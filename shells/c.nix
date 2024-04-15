{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    libgcc
    gcc
    gnumake
    cmake
    valgrind
    clang-tools
    gdb
  ];
}
