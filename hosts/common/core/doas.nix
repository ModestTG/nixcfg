{ pkgs, lib, ... }:

{
  #Replace sudo with doas
  environment.etc."doas.conf".text = lib.mkForce ''
    permit persist eweishaar
  '';
  security.sudo.enable = false;
  security.doas.enable = true;

}
