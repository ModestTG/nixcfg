{ ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      cat = "bat";
      k = "kubectl";
      ll = "ls -alh";
      man = "batman";
      sudo = "doas";
      vim = "nvim";
      v = "nvim";
    };
  };
}
