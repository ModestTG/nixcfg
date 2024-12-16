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
    systemd-boot.enable = false;
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
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
