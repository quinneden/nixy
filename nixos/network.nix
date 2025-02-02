{ config, lib, ... }:
{
  systemd.services.NetworkManager-wait-online.enable = false;

  networking = {
    hostname = config.var.hostname;

    useDHCP = lib.mkDefault false;
    interfaces.wlan0.useDHCP = lib.mkDefault true;
    wireless.iwd = {
      enable = true;
      settings = {
        IPv6.Enabled = true;
        Settings.AutoConnect = true;
        General.EnableNetworkConfiguration = true;
      };
    };

    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };
}
