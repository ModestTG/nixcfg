{
  inputs,
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
          libreoffice
          mqtt-explorer
          podman-desktop
          qFlipper
          signal-desktop
          spotify
          wireshark
          xfce.thunar
          xfce.tumbler
        ]
        ++ lib.optionals cfg.deployNode [
          inputs.colmena.packages.${pkgs.stdenv.hostPlatform.system}.colmena
          inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.agenix
          restic
          restic-browser
        ];
    };
    stylix = {
      iconTheme = {
        enable = true;
        package = pkgs.tokyonight-gtk-theme;
        dark = "Tokyonight-Dark";
      };
      targets = {
        nixvim.transparentBackground = {
          main = true;
          numberLine = true;
          signColumn = true;
        };
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
