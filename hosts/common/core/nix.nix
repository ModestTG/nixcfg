{ pkgs, lib, inputs, ... }:

{
  system.autoUpgrade = {
    enable = true;
    dates = "01:00";
    flake = inputs.self.outPath;
    flags = [ "--update-input" "nixpkgs" "-L" ];
    randomizedDelaySec = "30min";
  };
  nix = {
    package = pkgs.nixFlakes;
    settings = {
      connect-timeout = 5;
      log-lines = 25;
      min-free = 128000000; # 128MB
      max-free = 1000000000; # 1GB
      warn-dirty = false;
      experimental-features = [ "nix-command" "flakes" ];

    };
    gc = {
      automatic = true;
      dates = "02:00";
      options = "--delete-older-than 14d";
      randomizedDelaySec = "10min";
    };
    optimise = {
      automatic = true;
      dates = [ "03:00" ];
    };
  };
  nixpkgs.config.allowUnfree = lib.mkForce true;
}
