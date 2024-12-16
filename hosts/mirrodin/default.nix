{ userlib, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./disko-config.nix
    ]
    ++ (map userlib.relativeToRoot [
      "hosts/common/core"
      "hosts/common/optional/services/openssh.nix"
      "hosts/common/users/eweishaar/mirrodin.nix"
    ]);

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
