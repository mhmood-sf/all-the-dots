{
  description = "i've no idea what i'm doing";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
      pkgs-self = self.packages.${system};
      hm = home-manager;
      colors = import ./colors;
    in {
    # Used with `nixos-rebuild --flake .#<hostname>`
    nixosConfigurations = {
      snowman-ms = nixpkgs.lib.nixosSystem {
        modules = [
          # Host configuration
          ./host/snowman-ms

          # Home-manager module
          hm.nixosModules.home-manager

          # Home-manager configuration
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.atlin = ./home/atlin;
              users.guest = ./home/guest;
              # Pass other arguments besides pkgs.
              extraSpecialArgs = { inherit colors pkgs-unstable pkgs-self; };
            };
          }
        ];
      };
    };

    devShells.${system} = import ./shells { inherit pkgs pkgs-unstable; };
    packages.${system} = import ./pkgs { inherit pkgs pkgs-unstable colors; };
  };
}
