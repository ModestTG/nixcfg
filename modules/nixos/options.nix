{ lib, ... }:

{
  ### Custom options
  options.ewhsModule = {
    browser = lib.mkOption {
      type = lib.types.nullOr (
        lib.types.enum [
          "firefox"
          "helium"
          "zen"
        ]
      );
      description = "Enable a web browser";
      default = null;
    };
    colorscheme = lib.mkOption {
      type = lib.types.str;
      default = "tokyonight";
      description = "Define which colorscheme you want to use";
    };
    desktop = {
      audio = {
        enable = lib.mkEnableOption "enables Pipewire audio";
      };
      bar = lib.mkOption {
        type = lib.types.str;
        default = "";
        description = "Set the bar for the desktop";
      };
      bluetooth = {
        enable = lib.mkEnableOption "enable Bluetooth";
      };
      brother-printer = {
        enable = lib.mkEnableOption "enable Brother Printer support";
      };
      displayManager = lib.mkOption {
        type = lib.types.str;
        default = "ly";
        description = "Set the display manager";
      };
      displayProtocol = lib.mkOption {
        type = lib.types.nullOr (
          lib.types.enum [
            "xorg"
            "wayland"
          ]
        );
        default = null;
        description = "The current display Protocol";
      };
      enable = lib.mkEnableOption "Enable the desktop";
      launcher = lib.mkOption {
        type = lib.types.str;
        default = "";
        description = "Set the program launcher";
      };
      nerdFonts = {
        enable = lib.mkEnableOption "Enable Nerdfonts";
      };
      notifier = lib.mkOption {
        type = lib.types.str;
        default = "dunst";
        description = "Specify which notifier to use";
      };
      scanner = {
        enable = lib.mkEnableOption "enable Epson Scanner support";
      };
      sessionManager = lib.mkOption {
        type = lib.types.str;
        default = "";
        description = "Set the session manager for logout, restart, shutdown, etc.";
      };
      wm = lib.mkOption {
        type = lib.types.listOf (
          lib.types.enum [
            "cosmic"
            "sway"
          ]
        );
        default = [ ];
        description = "Define the window manager used on a desktop";
      };
    };
    doas = {
      enable = lib.mkEnableOption "replaces sudo with doas";
    };
    gaming = {
      misc = {
        enable = lib.mkEnableOption "enables miscellaneous gaming features";
      };
      steam = {
        enable = lib.mkEnableOption "enable Steam";
      };
    };
    fs = {
      nfs = {
        enable = lib.mkEnableOption "enable NFS access";
      };
    };
    homeManager = {
      enable = lib.mkEnableOption "Enable Home Manager";
    };
    nix = {
      autoupgrade = {
        enable = lib.mkEnableOption "enable nix automatic upgrades";
      };
    };
    pkgs = {
      audible2m4b = {
        enable = lib.mkEnableOption "Install audible2m4b program";
      };
      git = {
        enable = lib.mkEnableOption "Enable Git";
      };
      kube-tools = {
        enable = lib.mkEnableOption "Enable Kubernetes Tooling";
      };
      nvim = {
        enable = lib.mkEnableOption "Enable Nixvim and config";
      };
      prusa-slicr = {
        enable = lib.mkEnableOption "Enables Prusa Slicer";
      };
      ssh = {
        enable = lib.mkEnableOption "Enable SSH Client Configuration";
      };
      starship = {
        enable = lib.mkEnableOption "Enable starship";
      };
      tmux = {
        enable = lib.mkEnableOption "Enable tmux configuration";
        sessions = lib.mkOption {
          type = lib.types.listOf (
            lib.types.enum [
              "quadlets"
            ]
          );
          default = [ ];
          description = "List of sessions to enable";
        };
      };
    };
    shell = lib.mkOption {
      type = lib.types.str;
      default = "bash";
      description = "Specify which shell to use";
    };
    svc = {
      caddy = {
        enable = lib.mkEnableOption "enable Caddy service";
      };
      mosquitto = {
        enable = lib.mkEnableOption "enable Mosquitto MQTT service";
      };
      ollama = {
        enable = lib.mkEnableOption "enable ollama service";
      };
      sops = {
        enable = lib.mkEnableOption "enables sops";
      };
      ssh = {
        enable = lib.mkEnableOption "enable SSH Server";
      };
      syncthing = {
        enable = lib.mkEnableOption "Enable syncthing service";
      };
      tailscale = {
        enable = lib.mkEnableOption "enable Tailscale service";
      };
    };
    terminal = lib.mkOption {
      type = lib.types.str;
      default = "alacritty";
      description = "Specify which terminal to use";
    };
    virt = {
      platforms = lib.mkOption {
        type = lib.types.listOf (
          lib.types.enum [
            "docker"
            "podman"
          ]
        );
        default = [ ];
        description = "A list of container platforms to enable";
      };
    };
  };
}
