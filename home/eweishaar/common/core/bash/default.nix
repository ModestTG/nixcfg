{ ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      cat = "bat";
      k = "kubectl";
      lg = "lazygit";
      ll = "ls -alh";
      man = "batman";
      sudo = "doas";
      vim = "nvim";
      v = "nvim";
    };
  };
}
