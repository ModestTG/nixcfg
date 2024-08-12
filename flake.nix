{
  description = "EWHS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (inputs.nixpkgs) lib;
      system = "x86_64-linux";
      # pkgs = nixpkgs.legacyPackages.${system};
      userlib = import ./lib {inherit lib;};
      uservars = import ./vars {inherit lib;};
      specialArgs = { inherit inputs userlib uservars; };
    in
    {

      nixosConfigurations = {
        dominaria = lib.nixosSystem {
          inherit specialArgs;
          modules = [ 
            ./hosts/dominaria
            home-manager.nixosModules.home-manager {
              home-manager.extraSpecialArgs = specialArgs;
            }
          ];
        };
      };
    };
}
