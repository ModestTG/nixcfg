{ osConfig, lib, ... }:

let
  cfg = osConfig.ewhsModule;
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
    sctl = "systemctl";
    sctlu = "systemctl --user";
  };
in
{
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
