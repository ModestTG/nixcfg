{
  config,
  lib,
  pkgs,
  ...
}:

let
  tokyonight-gtk-icon-theme = pkgs.tokyonight-gtk-theme.override {
    iconVariants = [ "Dark" ];
  };
  # vimix-cursors = pkgs.vimix-cursors.overrideAttrs (oldAttrs: {
  #   # This forces a rebuild by changing the derivation
  #   preferLocalBuild = true;
  # });
  flameshot-wlr = pkgs.flameshot.override {
    enableWlrSupport = true;
  };
in
{
  options = {
    homeModule.desktop = {
      enable = lib.mkEnableOption "Enable the desktop";
      desktop.wm = lib.mkOption {
        type = lib.types.str;
        default = "sway";
        description = "Define the window manager used on a desktop";
      };
    };
  };

  config = lib.mkIf config.homeModule.desktop.enable {
    home = {
      packages = with pkgs; [
        brave
        discord
        freecad-wayland
        gthumb
        handbrake
        immich-go
        jellyfin-media-player
        kdePackages.kolourpaint
        libreoffice
        mqtt-explorer
        qflipper
        signal-desktop
        spotify
        xfce.thunar
        xfce.tumbler
        wireshark
      ];
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
