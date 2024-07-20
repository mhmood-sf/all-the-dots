{ colors, callPackage, symlinkJoin, tmux, makeWrapper }:
let tmux-config = callPackage ./tmux-config.nix { inherit colors; };
in symlinkJoin {
  name = "tmux";
  paths = [ tmux ];
  buildInputs = [ makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/tmux --add-flags "-f ${tmux-config}"
  '';
}
