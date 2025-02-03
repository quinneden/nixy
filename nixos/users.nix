{ config, pkgs, ... }:
let
  inherit (config.var) username;
in
{
  programs.zsh.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;

    users.${username} = {
      description = "Quinn Edenfield";
      isNormalUser = true;

      extraGroups = [
        "networkmanager"
        "wheel"
      ];

      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJyLtibXqcDXRQ8DzDUbVw71YA+k+L7fH7H3oPYyjFII"
      ];
    };

    users.root.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJyLtibXqcDXRQ8DzDUbVw71YA+k+L7fH7H3oPYyjFII"
    ];
  };
}
