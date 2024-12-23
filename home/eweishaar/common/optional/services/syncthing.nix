{
  services.syncthing = {
    enable = true;
    settings.gui = {
      user = "eweishaar";
      # Generated using `mkpasswd -m bcrypt`
      password = "$2b$05$ne3gxKwzG32W7bWv9nNAMe88nEAmXxOk.AodCFJfBQo5/0pmQZXuq";
    };
  };
}
