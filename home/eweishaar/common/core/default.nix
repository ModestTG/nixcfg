{ config, lib, pkgs, outputs, userlib, ... }:

{
  imports = userlib.scanPaths ./.;

  home = {
    username = lib.mkDefault "eweishaar";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = "24.05";
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = {
      FLAKE = "$HOME/nixcfg";
      SHELL = "bash";
      TERM = "alacritty";
      TERMINAL = "alacritty";
      EDITOR = "nvim";
      MANPAGER = "batman"; # see ./cli/bat.nix
    };
  };

  home.packages = with pkgs; [
    bat
    btop # resource monitor
    lazygit
    ncdu # TUI disk usage
    neofetch
    nix-tree # nix package tree viewer
    python3Packages.pynvim
    ripgrep # better grep
    wl-clipboard
    xfce.thunar
  ];

  nixpkgs.config.allowUnfree = true;

  programs = { home-manager.enable = true; };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
