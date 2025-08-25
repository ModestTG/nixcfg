{
  config,
  lib,
  inputs,
  ...
}:

let
  cfg = config.nixosModule.nix.autoupgrade;
in
{
  options.nixosModule.nix.autoupgrade = {
    enable = lib.mkEnableOption "enable nix automatic upgrades";
  };

  config = lib.mkIf cfg.enable {
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
  };
}
