{
  config,
  inputs,
  lib,
  ...
}:

{
  imports = [ inputs.zen-browser.homeModules.twilight ];
  options = {
    homeModule.browser = lib.mkOption {
      type = lib.types.enum [
        "firefox"
        "zen"
      ];
      description = "Enable a web browser";
      default = "firefox";
    };
  };

  config = {
    programs.firefox = lib.mkIf (config.homeModule.browser == "firefox") {
      enable = true;
    };
    programs.zen-browser = lib.mkIf (config.homeModule.browser == "zen") {
      enable = true;
    };
  };
}
