{ pkgs }:
let
  # Custom Packages
  aks-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "aks-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "mhmood-sf";
      repo = "aks-nvim";
      rev = "e72c642baa7e0df0feb217bf91e91985a1c10059";
      hash = "sha256-lly7Rj/HqHJ4jgKv3Xd89X1JHC5v6t1rbNrU+B8U/98=";
    };
  };
  lazyfox-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "lazyfox-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "mhmood-sf";
      repo = "lazyfox-nvim";
      rev = "0b6fe8c23a1f93dd8bd5dc56c6239fbc247ffe69";
      hash = "sha256-hj0gRLei9ohbshLD3SHyDjo6kBMWntg+rm48+WI4kjo=";
    };
  };
  linecook-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "linecook-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "mhmood-sf";
      repo = "linecook-nvim";
      rev = "4d3b4d19367f57158e48efc36ed691d207b6392a";
      hash = "sha256-50Ur7g301Z4qp4EiR4hdCt22Y29jx5qGXXYS2dc22X0=";
    };
  };

  # My Neovim Config (as a plugin)
  config = pkgs.vimUtils.buildVimPlugin {
    name = "config";
    src = ./dots;
  };

  # Neovim package with all the plugins and config.
  nvim = pkgs.neovim.override {
    configure = {
      # Our "customRC" will simply call `init.lua`.
      customRC = ''lua require("init")'';
      packages.pkgs = {
        opt = [];
        start = with pkgs.vimPlugins; [
          # My config.
          config

          # All the other plugins.
          aks-nvim
          cmp-nvim-lsp
          cmp-buffer
          gitsigns-nvim
          lazyfox-nvim
          linecook-nvim
          lualine-nvim
          nvim-autopairs
          nvim-cmp
          nvim-lspconfig
          plenary-nvim
          telescope-nvim

          (nvim-treesitter.withPlugins (p: [
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
        ];
      };
    };
  };
in pkgs.mkShell {
  packages = [ nvim ];
}
