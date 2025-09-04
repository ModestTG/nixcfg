{ config, lib, ... }:

let
  cfg = config.homeModule;
  shellAliases = {
    cat = "bat";
    k = "kubectl";
    lg = "lazygit";
    ll = "ls -alh";
    man = "batman";
    s = "systemctl";
    sudo = "doas";
    vim = "nvim";
    v = "nvim";
  };
in
{
  options.homeModule.shell = lib.mkOption {
    type = lib.types.str;
    default = "bash";
    description = "Specify which shell to use";
  };

  config = {
    programs.bash = lib.mkIf (cfg.shell == "bash") {
      enable = true;
      inherit shellAliases;
    };
    programs.nushell = lib.mkIf (cfg.shell == "nushell") {
      enable = true;
      inherit shellAliases;
      settings = {
        edit_mode = "vi";
      };
    };
  };
}
