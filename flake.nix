{
  description = "my flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
      hm = home-manager;
    in {
    # Used with `nixos-rebuild --flake .#<hostname>`
    nixosConfigurations = {
      snowman-ms = nixpkgs.lib.nixosSystem {
        modules = [
          ./host/snowman-ms

          hm.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.atlin = ./home/atlin;
              users.guest = ./home/guest;
            };
          }
        ];
      };
    };

    # Used with `nix [develop|shell] <flake>#<lang>`
    devShells.${system} = import ./shells { inherit pkgs; };
  };
}
