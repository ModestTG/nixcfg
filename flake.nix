{
  description = "EWHS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hardware.url = "github:nixos/nixos-hardware";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    determinate = {
      url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    colmena = {
      url = "github:zhaofengli/colmena";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hytale-launcher = {
      url = "github:TNAZEP/HytaleLauncherFlake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      disko,
      nixpkgs-stable,
      ...
    }@inputs:
    let
      lib = inputs.nixpkgs.lib;
      system = "x86_64-linux";
      pkgs-stable = import nixpkgs-stable {
        inherit system;
      };
      userlib = import ./lib { inherit lib; };
      specialArgs = {
        inherit
          inputs
          userlib
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
            ./modules/nixos
          ];
        };
        # lorwyn = lib.nixosSystem {
        #   inherit specialArgs system;
        #   modules = [
        #     ./hosts/lorwyn
        #     ./modules/nixos
        #   ];
        # };
        mirrodin = lib.nixosSystem {
          inherit specialArgs system;
          modules = [
            ./hosts/mirrodin
            ./modules/nixos
          ];
        };
      };
    };
}
