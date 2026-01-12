{
  lib,
  osConfig,
  pkgs,
  userlib,
  ...
}:
let
  cfg = osConfig.ewhsModule;
in
{
  imports = userlib.scanPaths ./.;
  home.packages =
    with pkgs;
    [
      exiftool # image metadata manipulation
      exiv2
      ffmpeg
      ncdu # TUI disk usage
      nix-tree # nix package tree viewer
    ]
    ++ lib.optional cfg.pkgs.audible2m4b.enable pkgs.audible2m4b
    ++ lib.optional cfg.pkgs.prusa-slicr.enable pkgs.prusa-slicer;
  programs = {
    bat = {
      enable = true;
      extraPackages = [
        pkgs.bat-extras.batman
      ];
    };
    btop.enable = true;
    eza = {
      enable = true;
      colors = "auto";
      extraOptions = [ "--group" ];
    };
    fastfetch.enable = true;
    home-manager.enable = lib.mkIf cfg.homeManager.enable true;
    mpv.enable = true;
    nushell.enable = true;
    ripgrep.enable = true;
  };
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  xdg.enable = true;
}
