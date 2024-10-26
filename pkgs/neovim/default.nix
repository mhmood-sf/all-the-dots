{ neovim, vimUtils, vimPlugins, fetchFromGitHub }:
let
  # Custom Packages
  my = {
    aks-nvim = vimUtils.buildVimPlugin {
      name = "aks-nvim";
      src = fetchFromGitHub {
        owner = "mhmood-sf";
        repo = "aks-nvim";
        rev = "25b1b50cb76ca7358ad98749294546fe660677cc";
        hash = "sha256-mxl5vnPnkpRIz15gdKybW6JxnUph0rwD9khEQV1RicU=";
      };
    };
    lazyfox-nvim = vimUtils.buildVimPlugin {
      name = "lazyfox-nvim";
      src = fetchFromGitHub {
        owner = "mhmood-sf";
        repo = "lazyfox-nvim";
        rev = "0b6fe8c23a1f93dd8bd5dc56c6239fbc247ffe69";
        hash = "sha256-hj0gRLei9ohbshLD3SHyDjo6kBMWntg+rm48+WI4kjo=";
      };
    };
    linecook-nvim = vimUtils.buildVimPlugin {
      name = "linecook-nvim";
      src = fetchFromGitHub {
        owner = "mhmood-sf";
        repo = "linecook-nvim";
        rev = "4d3b4d19367f57158e48efc36ed691d207b6392a";
        hash = "sha256-50Ur7g301Z4qp4EiR4hdCt22Y29jx5qGXXYS2dc22X0=";
      };
    };
  };

  # My Neovim Config, as a plugin.
  config-nvim = vimUtils.buildVimPlugin {
    name = "config-nvim";
    src = ./dots;
  };

  # Neovim package with all the plugins and config.
in neovim.override {
  withRuby = false;
  withPython3 = false;
  withNodeJs = false;
  configure = {
    # Our "customRC" will just call `init.lua`.
    customRC = ''lua require("init")'';
    packages.foo = {
      opt = [];
      start = with vimPlugins; [
        # My config.
        config-nvim

        # My plugins
        my.aks-nvim
        my.lazyfox-nvim
        my.linecook-nvim

        # Rest of the plugins.
        cmp-nvim-lsp
        cmp-buffer
        gitsigns-nvim
        lean-nvim
        nabla-nvim
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
}
