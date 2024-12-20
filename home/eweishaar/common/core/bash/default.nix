{ ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ctn = "compose2nix --output default.nix";
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
