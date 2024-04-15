{
  mkShell,
  libgcc,
  gcc,
  gnumake,
  cmake,
  valgrind,
  clang-tools,
  gdb
}:

mkShell {
  packages = [
    libgcc
    gcc
    gnumake
    cmake
    valgrind
    clang-tools
    gdb
  ];
}
