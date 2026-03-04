{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.ewhsModule.desktop;
in
{
  imports = [ inputs.stylix.nixosModules.stylix ];
  config = lib.mkIf cfg.enable {
    programs = {
      dconf.enable = true;
      yubikey-manager.enable = true;
    };
    security = {
      pam.services.login.enableGnomeKeyring = true;
      polkit.enable = true;
    };
    services = {
      dbus.enable = true;

      # USB Support
      devmon.enable = true;
      gvfs.enable = true;
      udisks2.enable = true;

      # Yubikey support
      pcscd.enable = true;
      udev.packages = [ pkgs.yubikey-personalization ];

      gnome.gnome-keyring.enable = true;
    };

    environment.systemPackages = with pkgs; [ feishin ];

    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/eighties.yaml";
      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.fira-code;
          name = "FiraCode Nerd Font Propo";
        };
      };
      cursor = {
        package = pkgs.vimix-cursors;
        name = "Vimix-cursors";
        size = 22;
      };
      opacity = {
        terminal = 0.9;
        popups = 0.9;
      };
    };
  };
}
