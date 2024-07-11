{ pkgs, pkgs-unstable, ... }:
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
      # TODO: Return to stable on next release.
      package = pkgs-unstable.neovim;
      defaultEditor = true;
      withRuby = false;
      withPython3 = false;
      withNodeJs = false;

      plugins = with pkgs.vimPlugins; [
        aks-nvim
        cmp-nvim-lsp
        cmp-buffer
        gitsigns-nvim
        lazyfox-nvim
        lualine-nvim
        nvim-autopairs
        nvim-cmp
        nvim-lspconfig
        # TODO: Return to stable on next release.
        pkgs-unstable.vimPlugins.nvim-snippets
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

    xdg.configFile."nvim" = {
      enable = true;
      recursive = true;
      source = ./dots;
    };
  };
}
