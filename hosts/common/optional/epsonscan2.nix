{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ epsonscan2 ];
  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.epsonscan2 ];
  };
}
