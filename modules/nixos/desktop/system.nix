{ config, pkgs, userSettings, ... }:

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
  networking.firewall.enable = false;
  
  ### TIMEZONE AND LOCALE
  time.timeZone = "US/Central";
  i18n.defaultLocale = "en_US.UTF-8";

  ### USERS
  users.users."${userSettings.username}" = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
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

  ### SSH
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      KexAlgorithms = [
        "sntrup761x25519-sha512@openssh.com"
        "curve25519-sha256"
        "curve25519-sha256@libssh.org"
        "diffie-hellman-group18-sha512"
        "diffie-hellman-group-exchange-sha256"
        "diffie-hellman-group14-sha256"
      ];
    };
  };

  ### SYSTEM PACKAGES
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
    vim

    #Browsers
    brave

    neofetch
    pulseaudio
    xfce.thunar
  ];
}

