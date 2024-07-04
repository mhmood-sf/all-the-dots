{ pkgs, ... }:
let
  # My colorscheme plugins
  aks-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "aks-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "mhmood-sf";
      repo = "aks-nvim";
      rev = "934d2f79ae926373a5db5101fedfe4665055e7e6";
      hash = "sha256-B92bKMHDwiTvllHTkQoDZMbd41nZLoWqWPmWcHB9yGU=";
    };
  };
  lazyfox-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "lazyfox-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "mhmood-sf";
      repo = "lazyfox-nvim";
      rev = "c52785e20937109524b096fbf339345135bc6e08";
      hash = "sha256-luT2lhs2lTUjQikXDUQbkFofV0DVECSckDwKG8Ksxso=";
    };
  };
in
{
  config = {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      withRuby = false;
      withPython3 = false;
      withNodeJs = false;

      plugins = with pkgs.vimPlugins; [
        # LSP + Treesitter
        nvim-lspconfig
        (nvim-treesitter.withPlugins (p: [
          # TS Parsers
          p.zig
          p.zathurarc
          p.yaml
          p.xml
          p.vimdoc
          p.vim
          p.typst
          p.typescript
          p.toml
          p.tmux
          p.sql
          p.rust
          p.python
          p.nix
          p.markdown
          p.markdown_inline
          p.make
          p.luadoc
          p.lua
          p.latex
          p.json
          p.jsdoc
          p.javascript
          p.java
          p.html
          p.haskell
          p.gitignore
          p.gitcommit
          p.git_config
          p.csv
          p.css
          p.cpp
          p.cmake
          p.c
          p.bash
        ]))

        # Completion
        nvim-cmp
        cmp-nvim-lsp
        cmp-buffer

        # Fuzzy Finder / Search UI
        telescope-nvim

        # Git Decorations
        gitsigns-nvim

        # Colorschemes
        aks-nvim
        lazyfox-nvim

        # Utilities / Dependencies
        plenary-nvim
      ];
    };

    xdg.configFile."nvim" = {
      enable = true;
      recursive = true;
      source = ./dots;
    };
  };
}
