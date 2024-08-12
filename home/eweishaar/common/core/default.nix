{  config, lib, pkgs, outputs, userlib, ...}:

{
  imports = userlib.scanPaths ./.;

  home = {
    username = lib.mkDefault "eweishaar";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = "24.05";
    sessionPath = [
      "$HOME/.local/bin"
    ];
    sessionVariables = {
      FLAKE = "$HOME/nixcfg";
      SHELL = "bash";
      TERM = "alacritty";
      TERMINAL = "alacritty";
      EDITOR = "nvim";
      # MANPAGER = "batman"; # see ./cli/bat.nix
    };
  };

  home.packages = with pkgs; [
      btop # resource monitor
      coreutils # basic gnu utils
      curl
      findutils # find
      fzf # fuzzy search
      jq # JSON pretty printer and manipulator
      nix-tree # nix package tree viewer
      ncdu # TUI disk usage
      pciutils
      pfetch # system info
      pre-commit # git hooks
      p7zip # compression & encryption
      ripgrep # better grep
      usbutils
      tree # cli dir tree viewer
      unzip # zip extraction
      unrar # rar extraction
      wget # downloader
      zip
      bash
      bat
      lazygit
      tldr
      tmux
      unzipNLS
      wl-clipboard
      zstd
      neovim
      python3Packages.pynvim
      doas
      neofetch
      xfce.thunar
  ];

  nixpkgs.config.allowUnfree = true;

  programs = {
    home-manager.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
