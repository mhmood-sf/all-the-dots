{ neovim, vimUtils, vimPlugins, fetchFromGitHub }:
let
  # Custom Packages
  my = {
    aks-nvim = vimUtils.buildVimPlugin {
      name = "aks-nvim";
      src = fetchFromGitHub {
        owner = "mhmood-sf";
        repo = "aks-nvim";
        rev = "e165b58559f7fccd18f6f982c024ccc0b88e8609";
        hash = "sha256-VQR6eoj7uiNBJsDimGDZP+W1Mfc+hvQDX5z76tMgals=";
      };
    };
    lazyfox-nvim = vimUtils.buildVimPlugin {
      name = "lazyfox-nvim";
      src = fetchFromGitHub {
        owner = "mhmood-sf";
        repo = "lazyfox-nvim";
        rev = "9bbcb7132c2e96198f233287cf050c2248dd0b9d";
        hash = "sha256-OU6PoeW40l6t8YEVXppruopddlbDKREI0jrerdESrCQ=";
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
        typst-vim

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
