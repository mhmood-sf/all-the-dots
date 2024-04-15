# de

Configurations for the various desktop environments / window managers I use / have used. I used AwesomeWM for a while, before switching to Gnome when trying out NixOS for the first time. I now use RiverWM.

Switching DE/WM's is a bit annoying -- you need to import the nix config from this directory into the `host` (see imports in `hosts/HOST/default.nix`), AND you also need to import your own config for that DE/WM in your home manager config (see imports in `home/USER/default.nix`).
