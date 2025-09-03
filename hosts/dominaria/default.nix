{
  lib,
  userlib,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-cpu-amd-pstate
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd
    inputs.determinate.nixosModules.default
  ];

  nixosModule = {
    doas.enable = true;
    fs.nfs.enable = true;
    desktop = {
      audio.enable = true;
      bluetooth.enable = true;
      brother-printer.enable = true;
      scanner.enable = true;
      sway.enable = true;
      usb.enable = true;
    };
    gaming = {
      misc.enable = true;
      steam.enable = true;
    };
    svc = {
      sops.enable = true;
      ssh.enable = true;
      tailscale.enable = true;
    };
  };
  boot.loader = {
    systemd-boot.enable = false;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
    };
  };

  # environment.variables = {
  #   # Force GPU selection
  #   VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json";
  #
  #   # Additional environment variables to prefer dedicated GPU
  #   __GLX_VENDOR_LIBRARY_NAME = "amdgpu";
  #   LIBGL_DRIVERS_PATH = "/run/opengl-driver/lib/dri";
  # };
  networking = {
    hostName = "dominaria";
    firewall.enable = false;
    networkmanager.enable = true;
    enableIPv6 = false;
  };

  # https://github.com/NixOS/nixpkgs/issues/180175
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
  systemd.services.systemd-networkd-wait-online.enable = lib.mkForce false;

  system.stateVersion = "24.11";
}
