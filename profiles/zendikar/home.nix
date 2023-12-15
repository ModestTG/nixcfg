{ config, pkgs, username, nfs-server, ... }:

{
  ### DEFAULT
  home.username = username;
  home.homeDirectory = "/home/"+username;
  programs.home-manager.enable = true;
  home.stateVersion = "23.11"; # Please read the comment before changing.

  ### SSH 
  programs.ssh = {
    enable = true;    
    extraConfig = ''
      Identityfile ~/.ssh/id-laptop
    '';
  }; 
  services.ssh-agent.enable = true;
}
