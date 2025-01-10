{
  description = "I've no idea what I'm doing.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
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
    devShells.${system} = import ./shells { inherit pkgs pkgs-unstable; };
    packages.${system} = import ./pkgs { inherit pkgs pkgs-unstable colors; };

    nixosConfigurations = {
      snowman-ms = nixpkgs.lib.nixosSystem {
        modules = [
          ./host/snowman-ms

          hm.nixosModules.home-manager

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
  };
}
