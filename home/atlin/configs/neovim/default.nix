{ pkgs-self, ... }:
{
  config = {
    programs.neovim = {
      enable = true;
      # Use our custom neovim package.
      package = pkgs-self.neovim;
      defaultEditor = true;
      withRuby = false;
      withPython3 = false;
      withNodeJs = false;
    };
  };
}
