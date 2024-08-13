{ pkgs, lib, ... }:

{
  nix = {
    package = pkgs.nixFlakes;
    settings = {
      auto-optimise-store = true;
      connect-timeout = 5;
      log-lines = 25;
      min-free = 128000000; # 128MB
      max-free = 1000000000; # 1GB
      warn-dirty = false;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = lib.mkDefault true;
      dates = lib.mkDefault "weekly";
      options = lib.mkDefault "--delete-older-than 7d";
    };
  };
  nixpkgs.config.allowUnfree = lib.mkForce true;
}
