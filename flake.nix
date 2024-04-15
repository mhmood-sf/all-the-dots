{
  description = "my flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager-unstable = {
      url = "github:nix-community/home-manager";
    };
  };

  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, home-manager, home-manager-unstable, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
      hm = home-manager;
      hm-unstable = home-manager-unstable;
    in {
    # Used with `nixos-rebuild --flake .#<hostname>`
    nixosConfigurations = {
      snowman-ms = nixpkgs.lib.nixosSystem {
        modules = [
          ./host/snowman-ms

          hm.nixosModules.home-manager {
            home-manager = {
              extraSpecialArgs = { inherit hm-unstable; };
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
    devShells.x86_64-linux = (import ./shells { inherit pkgs pkgs-unstable; });
  };
}
