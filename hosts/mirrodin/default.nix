{
  lib,
  pkgs-stable,
  config,
  inputs,
  pkgs,
  userlib,
  ...
}:
let
  cfg = config.ewhsModule;
in
{
  imports = [
    ./hardware-configuration.nix
    ./disko-config.nix
    ../users
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-gpu-nvidia-nonprime
    inputs.hardware.nixosModules.common-pc-ssd
    inputs.determinate.nixosModules.default
    inputs.disko.nixosModules.disko
  ];

  ### Option declaration
  ewhsModule = {
    doas.enable = true;
    pkgs = {
      nvim.enable = true;
      git.enable = true;
      ssh.enable = true;
    };
    shell = "bash";
    svc = {
      sops.enable = true;
      ssh.enable = true;
    };
    terminal = "ghostty";
    virt.platforms = [
      "docker"
      "podman"
    ];
    fs.nfs.enable = true;
  };

  ### NixOS configuration
  hardware = {
    nvidia = {
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      nvidiaPersistenced = true;
    };
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        cudatoolkit
      ];
    };
    nvidia-container-toolkit.enable = true;
  };
  environment.systemPackages = with pkgs; [
    cudatoolkit
  ];
  boot.loader = {
    grub.enable = false;
    systemd-boot = {
      enable = true;
      configurationLimit = 20;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
  networking = {
    hostName = "mirrodin";
    firewall.enable = false;
    networkmanager.enable = true;
    enableIPv6 = false;
  };
  system.stateVersion = "24.11";

  ### Home-manager configuration
  home-manager = lib.mkIf cfg.homeManager.enable {
    extraSpecialArgs = { inherit inputs userlib pkgs-stable; };
    backupFileExtension = "hmbackup";
    users.eweishaar = {
      imports = [ ../../modules/home/default.nix ];
      home = {
        username = "eweishaar";
        homeDirectory = "/home/eweishaar";
        stateVersion = config.system.stateVersion;
        sessionPath = [ "$HOME/.local/bin" ];
        sessionVariables = {
          EDITOR = "nvim";
          FLAKE = "$HOME/nixcfg";
        };
      };
    };
  };
}
