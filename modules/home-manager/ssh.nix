{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;    
    extraConfig = ''
      Identityfile ~/.ssh/id-laptop
    '';
  }; 
  services.ssh-agent.enable = true;
}
