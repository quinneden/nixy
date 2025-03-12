{ config, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixos
    ./variables.nix
  ];

  home-manager.users."${config.var.username}" = import ./home.nix;
  system.stateVersion = "25.05";
}
