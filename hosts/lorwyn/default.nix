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
      "hosts/common/users/eweishaar/lorwyn.nix"
    ]);

  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 20;
    };
    grub.enable = false;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  networking = {
    hostName = "lorwyn";
    firewall.enable = false;
    networkmanager.enable = true;
    enableIPv6 = false;
  };
  system.stateVersion = "24.11";
}
