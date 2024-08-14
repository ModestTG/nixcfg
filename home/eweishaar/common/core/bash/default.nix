{ ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      cat = "bat";
      k = "kubectl";
      ll = "ls -alh";
      sudo = "doas";
      vim = "nvim";
      v = "nvim";
    };
  };
}
