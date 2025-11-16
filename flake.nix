{
  description = "F2 Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations.nebnix = nixpkgs.lib.nixosSystem {
      system = "aarch64";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.default {
           home-manager = {
             useGlobalPkgs = true;
             useUserPackages = true;
             users.neb = ./home.nix;
           };
        }
      ];
    };
  };
}
