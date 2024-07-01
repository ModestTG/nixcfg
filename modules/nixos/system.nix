{ config, pkgs, ... }:

{
  ### NIX FLAKES
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  ### UNFREE
  nixpkgs.config.allowUnfree = true;

  ### BOOTLOADER 
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ### NETWORKING
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  
  ### TIMEZONE AND LOCALE
  time.timeZone = "US/Central";
  i18n.defaultLocale = "en_US.UTF-8";

  ### USERS
  users.users."eweishaar" = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    description = "Elliot Weishaar";
    uid = 1000;
  };
  ### SOUND
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  ### FONTS 
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  ### SYSTEM PACKAGES
  environment.systemPackages = with pkgs; [
    alacritty
    bash
    bat
    brave
    curl
    git
    home-manager
    lazygit
    neovim
    neofetch
    pulseaudio
    python3Packages.pynvim
    ripgrep
    tldr
    tmux
    vim
    wget
    wl-clipboard
    xfce.thunar
  ];
}

