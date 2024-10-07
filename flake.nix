{
  description = "EWHS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hardware.url = "github:nixos/nixos-hardware";
    base16.url = "github:SenchoPens/base16.nix";
    theme_tokyonight = {
      url = "github:folke/tokyonight.nvim";
      flake = false;
    };
    nvim-nix = {
      url = "github:ModestTG/nvim-nix";
      inputs.nixpkgs.follows = "nixpkgs"
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixpkgs-stable,
      ...
    }@inputs:
    let
      inherit (inputs.nixpkgs) lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-stable = nixpkgs-stable.legacyPackages.${system};
      userlib = import ./lib { inherit lib; };
      uservars = import ./vars { inherit lib; };
      specialArgs = {
        inherit
          inputs
          userlib
          uservars
          pkgs-stable
          ;
      };
    in
    {

      nixosConfigurations = {
        dominaria = lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./hosts/dominaria
            home-manager.nixosModules.home-manager
            { home-manager.extraSpecialArgs = specialArgs; }
          ];
        };
      };
    };
}
