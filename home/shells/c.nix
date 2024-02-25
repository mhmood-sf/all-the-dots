let
  pkgs = import <nixplgs> {};
in
  pkgs.mkShell {
    packages = with pkgs; [
      libgcc
      gcc
      gnumake
      cmake
      valgrind
      clang-tools
      gdb
    ]
  }
