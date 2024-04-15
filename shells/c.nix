{ nixpkgs }:

nixpkgs.mkShell {
  packages = with nixpkgs; [
    libgcc
    gcc
    gnumake
    cmake
    valgrind
    clang-tools
    gdb
  ];
}
