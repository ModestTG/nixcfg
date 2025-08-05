{
  pkgs,
  userlib,
  ...
}:

{
  imports = userlib.scanPaths ./.;

  home.packages = with pkgs; [
    exiftool # image metadata manipulation
    exiv2
    ffmpeg
    ncdu # TUI disk usage
    nix-tree # nix package tree viewer
  ];
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batman
    ];
  };
  programs.btop.enable = true;
  programs.fastfetch.enable = true;
  programs.home-manager.enable = true;
  programs.mpv.enable = true;
  programs.ripgrep.enable = true;
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
