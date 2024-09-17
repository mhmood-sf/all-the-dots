{
  mkShell,
  texliveSmall
}:

mkShell {
  shellHook = ''
    echo "Entering Nix DevShell (lang: Teχ)"
    PS1="(TeX) $PS1"
  '';

  packages = [
    (texliveSmall.withPackages (ps: with ps; [
      bbold
      enumitem
      environ
      fontawesome
      fontaxes
      fpl
      kastrup
      listingsutf8
      marvosym
      mathpazo
      multirow
      newpx
      newtx
      palatino
      pdfcol
      preprint
      tcolorbox
      tikzfill
      titlesec
      transparent
      txfonts
      xstring
    ]))
  ];
}
