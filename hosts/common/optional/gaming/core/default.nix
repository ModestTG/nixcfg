{ pkgs, ... }:

{

  programs.steam = {
    enable = true;
    extraPackages = with pkgs; [
      gamescope
      gamemode
      mangohud
    ];
  };
  hardware.xone.enable = true;

  environment.systemPackages = with pkgs; [
    prismlauncher
    r2modman
    xmage
  ];
}
