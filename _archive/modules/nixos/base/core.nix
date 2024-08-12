{ lib, ... }:

{
  boot.loader = {
    systemd-boot = {
      enable = lib.mkDefault true;
      configurationLimit = lib.mkDefault 20;
      consoleMode = lib.mkDefault "max";
    };
    efi.canTouchEfiVariables = true;
  };
}
