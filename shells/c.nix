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
    echo "Entering Nix DevShell (lang: C)"
    PS1="(C) $PS1"
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
