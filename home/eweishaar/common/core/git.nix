{pkgs, lib, ...}:

{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "ModestTG";
    userEmail = "ssh@mailserver.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
