{ userlib, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./disko-config.nix
      inputs.hardware.nixosModules.common-cpu-intel
      inputs.hardware.nixosModules.common-gpu-nvidia-nonprime
      inputs.hardware.nixosModules.common-pc-ssd
    ]
    ++ (map userlib.relativeToRoot [
      "hosts/common/core"
      "hosts/common/optional/docker"
      "hosts/common/optional/nfs.nix"
      "hosts/common/optional/services/openssh.nix"
      "hosts/common/optional/services/syncthing.nix"
      "hosts/common/users/eweishaar/mirrodin.nix"
    ]);
  hardware.nvidia.open = true;
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
