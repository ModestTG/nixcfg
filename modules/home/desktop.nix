{
  lib,
  osConfig,
  pkgs,
  ...
}:

let
  flameshot-wlr = pkgs.flameshot.override {
    enableWlrSupport = true;
  };
  cfg = osConfig.ewhsModule;
in
{
  config = lib.mkIf cfg.desktop.enable {
    home = {
      packages =
        with pkgs;
        [
          discord
          freecad-wayland
          gthumb
          handbrake
          immich-go
          # jellyfin-media-player #qtweb-5 marked as insecure. Must be fixed upstream
          libreoffice
          mqtt-explorer
          podman-desktop
          qflipper
          signal-desktop
          spotify
          wireshark
          xfce.thunar
          xfce.tumbler
        ]
        ++ lib.optional cfg.deployNode colmena;
      pointerCursor = {
        gtk.enable = true;
        package = pkgs.vimix-cursors;
        name = "Vimix-cursors";
        size = 22;
      };
    };
    gtk = {
      enable = true;
      theme = {
        name = "Tokyonight-Dark";
        package = pkgs.tokyonight-gtk-theme;
      };
      iconTheme = {
        name = "Tokyonight-Dark";
        package = pkgs.tokyonight-gtk-theme;
      };
    };
    programs.feh.enable = true;
    programs.obsidian.enable = true;
    programs.yt-dlp.enable = true;
    programs.zathura.enable = true;
    services.flameshot = {
      enable = true;
      package = if (cfg.desktop.displayProtocol == "wayland") then flameshot-wlr else pkgs.flameshot;
      settings = {
        General = {
          useGrimAdapter = true;
          showStartupLaunchMessage = false;
          disabledTrayIcon = true;
          disabledGrimWarning = true;
        };
      };
    };
  };
}
