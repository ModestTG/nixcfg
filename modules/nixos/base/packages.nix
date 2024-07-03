{ pkgs, ... }:

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
    ripgrep
    tldr
    tmux
    wget
    wl-clipboard

    #Editors
    neovim
    python3Packages.pynvim

    #Browsers
    brave

    neofetch
    pulseaudio
    xfce.thunar
  ];
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}

