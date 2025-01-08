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
      s = "systemctl";
      sudo = "doas";
      vim = "nvim";
      v = "nvim";
    };
  };
}
