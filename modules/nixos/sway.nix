{ config, pkgs, ... }:

{
  security.polkit.enable = true;  
  
  services.dbus.enable = true;
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.sway}/bin/sway";
        user = "eweishaar";
      };
      default_session = initial_session;
    };
  };
  environment.systemPackages = with pkgs; [
    sway
    wayland
    xdg-utils
    glib
  ];
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk];
  };
}
