{ userlib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd
  ] ++ (map userlib.relativeToRoot [
    "hosts/common/core"
    "hosts/common/optional/sway.nix"
    "hosts/common/optional/pipewire.nix"
    "hosts/common/optional/services/openssh.nix"
    "hosts/common/optional/nfs.nix"
    "hosts/common/optional/epsonscan2.nix"
    "hosts/common/users/eweishaar"
  ]);

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
  networking = {
    hostName = "dominaria";
    firewall.enable = false;
    networkmanager.enable = true;
    enableIPv6 = false;
  };
  system.stateVersion = "24.05";
}
