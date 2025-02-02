{ config, ... }:
{
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    dockerSocket.enable = true;

    autoPrune = {
      enable = true;
      dates = [ "weekly" ];
      flags = [ "--all" ];
    };
  };

  users.users."${config.var.username}".extraGroups = [ "podman" ];
}
