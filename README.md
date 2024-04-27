# All The Dots

My dotfiles for basically everything. This repository itself is the entire NixOS configuration. If you are looking for a specific package configuration (neovim, awesomewm, etc.), you probably want to check out the `home/atlin/configs/` directory.

My current setup consists of:
- Display Protocol: Wayland
- Compositor / Window Manager: River
- Bar: Yambar
- Terminal: WezTerm
- Editor: Neovim
- Colorscheme: Lazyfox

TODO:
- [ ] Set up waylock properly.
- [ ] Centralize theming through nix (pass the colorscheme as a module argument).
- [ ] Gestures for river/wayland
- [ ] Consistent bindings across DE/WMs (in particular, update river bindings to be more consistent with awesomewm bindings).
- [ ] Set up cursor theme
- [ ] Improve notifications
- [ ] Fix night mode / gamma control.
