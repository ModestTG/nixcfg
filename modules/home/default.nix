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
  home.packages = [
    pkgs.exiftool # image metadata manipulation
    pkgs.exiv2
    pkgs.ffmpeg
    pkgs.ncdu # TUI disk usage
    pkgs.nix-tree # nix package tree viewer
  ]
  ++ lib.optionals cfg.pkgs.audible2m4b.enable [ pkgs.audible2m4b ]
  ++ lib.optionals cfg.pkgs.prusa-slicr.enable [ pkgs.prusa-slicer ];
  programs.bat = {
    enable = true;
    extraPackages = [
      pkgs.bat-extras.batman
    ];
  };
  programs.btop.enable = true;
  programs.fastfetch.enable = true;
  programs.home-manager.enable = lib.mkIf cfg.homeManager.enable true;
  programs.mpv.enable = true;
  programs.ripgrep.enable = true;
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  xdg.enable = true;
}
