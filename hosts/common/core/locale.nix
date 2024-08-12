{ lib, ... }:

{
  time.timeZone = lib.mkDefault "America/Chicago";
  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";
}
