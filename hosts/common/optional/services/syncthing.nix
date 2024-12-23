{
  services.syncthing = {
    enable = true;
    user = "root";
    group = "root";
    settings.gui = {
      user = "eweishaar";
      # Generated using `mkpasswd -m bcrypt`
      password = "$2b$05$ne3gxKwzG32W7bWv9nNAMe88nEAmXxOk.AodCFJfBQo5/0pmQZXuq";
    };
  };
  systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true";
}
