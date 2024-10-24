{ pkgs, ... }:

{
  security.polkit.enable = true;
  services.dbus.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --time --theme 'border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red' --cmd ${pkgs.swayfx}/bin/sway";
        user = "eweishaar";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    autotiling
    dconf
    dunst
    glib
    libnotify
    playerctl
    swayfx
    swayidle
    swaylock
    swww
    waybar
    wayland
    wlogout
    wofi
    xdg-utils
  ];

  programs.dconf = {
    enable = true;
  };
  security.pam.services.swaylock = { };
}
