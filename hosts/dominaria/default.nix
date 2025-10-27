{
  config,
  inputs,
  lib,
  pkgs-stable,
  userlib,
  ...
}:
let
  cfg = config.ewhsModule;
in
{
  imports = [
    ./hardware-configuration.nix
    ../users
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-cpu-amd-pstate
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd
    inputs.determinate.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
  ];

  ### Option declaration
  ewhsModule = {
    browser = "helium";
    doas.enable = true;
    homeManager.enable = true;
    shell = "bash";
    pkgs = {
      audible2m4b.enable = true;
      git.enable = true;
      kube-tools.enable = true;
      nvim.enable = true;
      prusa-slicr.enable = true;
      starship.enable = true;
      ssh.enable = true;
      tmux = {
        enable = true;
        sessions = [ "quadlets" ];
      };
    };
    fs.nfs.enable = true;
    desktop = {
      audio.enable = true;
      bar = "waybar";
      bluetooth.enable = true;
      brother-printer.enable = true;
      enable = true;
      launcher = "wofi";
      nerdFonts.enable = true;
      notifier = "dunst";
      scanner.enable = true;
      sessionManager = "wlogout";
      wm = [
        "cosmic"
        "sway"
      ];
    };
    gaming = {
      misc.enable = true;
      steam.enable = true;
    };
    svc = {
      sops.enable = true;
      ssh.enable = true;
      tailscale.enable = true;
    };
    virt.platforms = [
      "podman"
    ];
  };

  ### NixOS configuration
  networking = {
    hostName = "dominaria";
    firewall.enable = false;
    networkmanager.enable = true;
    enableIPv6 = false;
  };

  # https://github.com/NixOS/nixpkgs/issues/180175
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
  systemd.services.systemd-networkd-wait-online.enable = lib.mkForce false;

  # Add udev rules for Flipper Zero
  services.udev.extraRules = ''
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", MODE="0666", GROUP="plugdev"
  '';

  #SSH key
  sops.secrets."sshKeys/dominaria/private" = {
    path = "/home/eweishaar/.ssh/id_ed25519";
    owner = config.users.users.eweishaar.name;
    group = config.users.users.eweishaar.group;
    mode = "0600";
  };

  system.stateVersion = "24.11";

  ###Home-manager configuration
  home-manager = lib.mkIf cfg.homeManager.enable {
    extraSpecialArgs = { inherit inputs userlib pkgs-stable; };
    backupFileExtension = "hmbackup";
    users.eweishaar = {
      imports = [ ../../modules/home/default.nix ];
      home = {
        username = "eweishaar";
        homeDirectory = "/home/eweishaar";
        stateVersion = config.system.stateVersion;
      };
      xdg.mimeApps = {
        enable = true;
        defaultApplications = {
          "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "calc.desktop";
          "inode/directory" = "thunar.desktop"; # File Browser
        };
      };
      # Force overwrite mimeapps.list to avoid backup conflicts
      # https://github.com/nix-community/home-manager/issues/4199
      xdg.configFile."mimeapps.list".force = true;
      nixpkgs = {
        config = {
          allowUnfree = true;
        };
        overlays = [
          (
            self: super:
            lib.packagesFromDirectoryRecursive {
              callPackage = super.callPackage;
              directory = userlib.relativeToRoot "pkgs/home";
            }
          )
        ];
      };
    };
  };
}
