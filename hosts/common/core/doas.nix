{ lib, ... }:

{
  #Replace sudo with doas
  environment.etc."doas.conf".text = lib.mkForce ''
    permit persist eweishaar
  '';
  security.doas.enable = true;

}
