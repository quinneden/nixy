{ pkgs, config, ... }:
{

  imports = [
    ../../home/programs
    ../../home/scripts
    ../../home/system
    ./secret.nix
    ./variables.nix
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    packages = with pkgs; [
      # Apps
      bitwarden # Password manager
      vlc # Video player
      blanket # White-noise app
      obsidian # Note taking app
      planify # Todolists
      gnome-calendar # Calendar
      textpieces # Manipulate texts
      curtail # Compress images

      # Dev
      go
      nodejs
      python3
      jq
      just
      pnpm

      # Utils
      zip
      unzip
      optipng
      pfetch
      btop
      fastfetch

      # Just cool
      peaclock
      cbonsai
      pipes
      cmatrix
    ];

    # Don't touch this
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
