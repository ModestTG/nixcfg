{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    nixosModule.desktop.audio.enable = lib.mkEnableOption "enables Pipewire audio";
  };

  config = lib.mkIf config.nixosModule.desktop.audio.enable {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      jack.enable = true;
    };

    environment.systemPackages = with pkgs; [
      pulseaudio
      pamixer
      pavucontrol
    ];
  };
}
