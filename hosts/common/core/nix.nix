{
  pkgs,
  lib,
  inputs,
  ...
}:

{
  system.autoUpgrade = {
    enable = true;
    dates = "01:00";
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "--commit-lock-file"
      "-L"
      "--write-to-file"
      "${inputs.self.outPath}/flake.lock"
    ];
    randomizedDelaySec = "30min";
  };
  nix = {
    package = pkgs.nixVersions.stable;
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
      extraArgs = "--keep-since 10d --keep 3";
    };
  };
  nixpkgs.config.allowUnfree = lib.mkForce true;
}
