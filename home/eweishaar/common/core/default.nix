{
  config,
  lib,
  pkgs,
  userlib,
  ...
}:

{
  imports = userlib.scanPaths ./.;

  home = {
    username = lib.mkDefault "eweishaar";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = "24.11";
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = {
      FLAKE = "$HOME/nixcfg";
      TERM = "alacritty";
      TERMINAL = "alacritty";
      EDITOR = "nvim";
      KUBECONFIG = if config.programs.k9s.enable then "/home/eweishaar/jace-cluster/kubeconfig" else "";
    };
    packages = with pkgs; [
      bat
      bat-extras.batman
      btop # resource monitor
      exiftool # image metadata manipulation
      exiv2
      fastfetch # Neofetch replacement
      ffmpeg
      mpv
      ncdu # TUI disk usage
      nix-tree # nix package tree viewer
      ripgrep # better grep
      signal-desktop # signal desktop client
    ];
  };

  nixpkgs.config.allowUnfree = true;

  programs = {
    home-manager.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
