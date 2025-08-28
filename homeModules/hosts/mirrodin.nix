{ osConfig, lib, ... }:

{
  config = lib.mkIf (osConfig.networking.hostName == "mirrodin") {

    homeModule.pkgs.nvim.enable = true;
    homeModule.pkgs.git.enable = true;
    homeModule.pkgs.ssh.enable = true;
    homeModule.terminal = "ghostty";
    homeModule.shell = "bash";

    home = {
      username = "eweishaar";
      homeDirectory = "/home/eweishaar";
      stateVersion = "24.11";
      sessionPath = [ "$HOME/.local/bin" ];
      sessionVariables = {
        EDITOR = "nvim";
        FLAKE = "$HOME/nixcfg";
      };
    };
  };
}
