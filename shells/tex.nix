{ nixpkgs }:

nixpkgs.mkShell {
  packages = with nixpkgs; [
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
