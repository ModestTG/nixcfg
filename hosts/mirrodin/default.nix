{
  config,
  inputs,
  pkgs,
  userlib,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./disko-config.nix
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-gpu-nvidia-nonprime
    inputs.hardware.nixosModules.common-pc-ssd
    inputs.determinate.nixosModules.default
  ];

  nixosModule = {
    doas.enable = true;
    svc = {
      sops.enable = true;
      ssh.enable = true;
    };
    virt.docker.enable = true;
    fs.nfs.enable = true;
  };

  hardware = {
    nvidia = {
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        cudatoolkit
      ];
    };
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
}
