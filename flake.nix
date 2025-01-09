{
  description = "EWHS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
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
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ghostty.url = "github:ghostty-org/ghostty";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      disko,
      home-manager,
      nixpkgs,
      nixpkgs-stable,
      self,
      ...
    }@inputs:
    let
      inherit (inputs.nixpkgs) lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-stable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
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
          inherit specialArgs system;
          modules = [
            ./hosts/dominaria
            home-manager.nixosModules.home-manager
            { home-manager.extraSpecialArgs = specialArgs; }
          ];
        };
        lorwyn = lib.nixosSystem {
          inherit specialArgs system;
          modules = [
            ./hosts/lorwyn
            disko.nixosModules.disko
            home-manager.nixosModules.home-manager
            { home-manager.extraSpecialArgs = specialArgs; }
          ];
        };
        mirrodin = lib.nixosSystem {
          inherit specialArgs system;
          modules = [
            ./hosts/mirrodin
            disko.nixosModules.disko
            home-manager.nixosModules.home-manager
            { home-manager.extraSpecialArgs = specialArgs; }
          ];
        };
      };
    };
}
