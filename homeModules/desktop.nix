{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}:

let
  tokyonight-gtk-icon-theme = pkgs.tokyonight-gtk-theme.override {
    iconVariants = [ "Dark" ];
  };
  flameshot-wlr = pkgs.flameshot.override {
    enableWlrSupport = true;
  };
  cfg = config.homeModule.desktop;
  ncfg = osConfig.nixosModule;
in
{
  options.homeModule.desktop = {
    enable = lib.mkEnableOption "Enable the desktop";
    wm = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Define the window manager used on a desktop";
    };
    bar = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Set the bar for the desktop";
    };
    sessionManager = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Set the session manager for logout, restart, shutdown, etc.";
    };
    launcher = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Set the program launcher";
    };
  };

  config = lib.mkIf cfg.enable {
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
          qflipper
          signal-desktop
          spotify
          xfce.thunar
          xfce.tumbler
          wireshark
        ]
        ++ lib.optionals (lib.elem "podman" ncfg.virt.platforms) [ podman-desktop ];
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
        package = tokyonight-gtk-icon-theme;
      };
    };
    programs.feh.enable = true;
    programs.obsidian.enable = true;
    programs.yt-dlp.enable = true;
    programs.zathura.enable = true;
    services.flameshot = {
      enable = true;
      package = flameshot-wlr;
    };
  };
}
