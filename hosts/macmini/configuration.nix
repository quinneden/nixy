{ config, ... }:
{
  imports = [
    ../../nixos/asahi.nix
    ../../nixos/auto-upgrade.nix
    ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/home-manager.nix
    ../../nixos/network.nix
    ../../nixos/nix.nix
    ../../nixos/podman.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/timezone.nix
    ../../nixos/tuigreet.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/variables-config.nix
    ../../nixos/xdg-portal.nix
    ../../themes/stylix/2026.nix
    ./hardware-configuration.nix
    ./variables.nix
  ];

  home-manager.users."${config.var.username}" = import ./home.nix;

  security.sudo.wheelNeedsPassword = false;

  # Don't touch this
  system.stateVersion = "24.05";
}
