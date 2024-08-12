{ lib, userlib, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix 
    ] ++ (map userlib.relativeToRoot [
      "hosts/common/core"
      "hosts/common/optional/sway.nix"
      "hosts/common/optional/pipewire.nix"
      "hosts/common/optional/services/openssh.nix"
      "hosts/common/optional/nfs.nix"
      "hosts/common/users/eweishaar"
      ]);

  boot.loader = {
    systemd-boot = {
      enable = lib.mkDefault true;
      configurationLimit = lib.mkDefault 20;
      consoleMode = lib.mkDefault "max";
    };
    efi.canTouchEfiVariables = true;
  };
  networking = {
    hostName = "dominaria";
    firewall.enable = false;
    networkmanager.enable = true;
    enableIPv6 = false;
  };
  system.stateVersion = "24.05";
}
