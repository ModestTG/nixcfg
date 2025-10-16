{
  pkgs,
  inputs,
  lib,
  userlib,
  ...
}:

# Core configuration, installed on all systems
{
  imports = [ inputs.nix-index-database.nixosModules.nix-index ] ++ (userlib.scanPaths ./.);

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [
    age
    bash
    bc
    coreutils
    curl
    dig
    doas
    file
    findutils
    fzf
    gcc
    git
    jq
    just
    nh
    nix-ld
    nix-output-monitor
    nmap
    nurl
    p7zip
    pciutils
    pfetch
    pre-commit
    pwgen
    sops
    terminator
    tldr
    tmux
    tree
    unrar
    unzip
    usbutils
    vim
    vulnix
    wget
    yq
    zip
    zstd
  ];

  nix = {
    settings = {
      connect-timeout = 5;
      log-lines = 25;
      min-free = 128000000; # 128MB
      max-free = 1000000000; # 1GB
      warn-dirty = false;
      experimental-features = [
        "nix-command"
        "flakes"
      ];

    };
    optimise = {
      automatic = true;
      dates = [ "03:00" ];
    };
  };
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 10d --keep 20";
    };
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      (
        self: super:
        lib.packagesFromDirectoryRecursive {
          callPackage = super.callPackage;
          directory = userlib.relativeToRoot "pkgs/nixos";
        }
      )
    ];
  };
}
