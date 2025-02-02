{ config, ... }:
{
  time.timeZone = config.var.timeZone;
  i18n.defaultLocale = config.var.defaultLocale;
  i18n.defaultLocaleSettings = {
    LC_ADDRESS = config.var.defaultLocale;
    LC_IDENTIFICATION = config.var.defaultLocale;
    LC_MEASUREMENT = config.var.defaultLocale;
    LC_MONETARY = config.var.defaultLocale;
    LC_NAME = config.var.defaultLocale;
    LC_NUMERIC = config.var.defaultLocale;
    LC_PAPER = config.var.defaultLocale;
    LC_TELEPHONE = config.var.defaultLocale;
    LC_TIME = config.var.defaultLocale;
  };
}
