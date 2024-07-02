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
  shellHook = ''
  echo Entering Nix DevShell (lang: C)
  '';

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
