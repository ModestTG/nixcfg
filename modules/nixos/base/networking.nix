{ lib, ... }:

{  
  networking.networkmanager.enable = true;  
  networking.firewall.enable = lib.mkDefault false;
}
