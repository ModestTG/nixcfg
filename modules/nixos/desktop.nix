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
    programs.dconf.enable = true;
    security.polkit.enable = true;
    services.dbus.enable = true;
    # USB Support
    services.devmon.enable = true;
    services.gvfs.enable = true;
    services.udisks2.enable = true;
    # Yubikey support
    services.pcscd.enable = true;
    programs.yubikey-manager.enable = true;
    services.udev.packages = [ pkgs.yubikey-personalization ];

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
