{
  config,
  lib,
  inputs,
  ...
}:

let
  cfg = config.ewhsModule.nix.autoupgrade;
in
{
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
