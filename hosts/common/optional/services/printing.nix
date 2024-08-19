{ pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = [ pkgs.cups-brother-hll3230cdw ];
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };
}
