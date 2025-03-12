{ inputs, ... }:
let
  secretsPath = "${inputs.secrets}/sops";
in
{
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    age.keyFile = "/home/quinn/.config/sops/age/keys.txt";
    defaultSopsFile = "${secretsPath}/secrets.yaml";
    secrets = {
      github_token = { };

      "plain/rclone.ini" = {
        format = "ini";
        sopsFile = "${secretsPath}/plain/rclone.ini";
        path = "/home/quinn/.config/rclone/rclone.conf";
      };
    };
  };

  systemd.user.services.mbsync.Unit.After = [ "sops-nix.service" ];

  wayland.windowManager.hyprland.settings.exec-once = [ "systemctl --user start sops-nix" ];
}
