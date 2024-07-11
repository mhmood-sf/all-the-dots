{
  mkShell,
  texliveSmall
}:

mkShell {
  shellHook = ''
  echo "Entering Nix DevShell (lang: Teχ)"
  '';

  packages = [
    (texliveSmall.withPackages (ps: with ps; [
      newpx
      enumitem
      tcolorbox
      environ
      xstring
      fontaxes
      kastrup
      tikzfill
      pdfcol
      listingsutf8
      newtx
      txfonts
      titlesec
      multirow
      fontawesome
      transparent
      preprint
      marvosym
    ]))
  ];
}
