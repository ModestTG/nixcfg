{ pkgs, lib, userSettings, ... }:

{
  environment.systemPackages = with pkgs; [
    #Nix
    home-manager

    # Terminals
    alacritty

    #Shells
    bash

    #Utilities
    bat
    curl
    git
    lazygit
    p7zip
    ripgrep
    tldr
    tmux
    unzipNLS
    wget
    wl-clipboard
    xz
    zip
    zstd

    #Editors
    neovim
    python3Packages.pynvim

    #Browsers
    brave

    doas
    neofetch
    pulseaudio
    xfce.thunar
  ];
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  #Replace sudo with doas
  environment.etc."doas.conf".text = lib.mkForce ''
      permit persist ${userSettings.username}
    '';
  security.sudo.enable = false;
  security.doas.enable = true;

}

