{ config, lib, ... }:

let
  cfg = config.homeModule;
in
{
  options.homeModule.shell = lib.mkOption {
    type = lib.types.enum [
      "bash"
    ];
    default = "bash";
    description = "Specify which shell to use";
  };

  config = {
    programs.bash = lib.mkIf (cfg.shell == "bash") {
      enable = true;
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
    };
  };
}
