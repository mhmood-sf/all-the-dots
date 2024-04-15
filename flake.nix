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

  outputs = inputs @ { self, nixpkgs, home-manager, ... }: {
    # Used with `nixos-rebuild --flake .#<hostname>`
    nixosConfigurations = {
      snowman-ms = nixpkgs.lib.nixosSystem {
        modules = [
          ./host/snowman-ms

          home-manager.nixosModules.home-manager {
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

    # Used with `nix develop .#<lang>`
    devShells.x86_64-linux = (import ./shells { inherit nixpkgs });
  };
}
