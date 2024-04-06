let
  pkgs = import <nixpkgs> {};
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
    ];
  }
