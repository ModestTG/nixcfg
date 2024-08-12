{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;    
    extraConfig = ''
      IdentityFile = ~/.ssh/id_dominaria
    '';
    addKeysToAgent = "yes";
  }; 

}
