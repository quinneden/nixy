{ pkgs, config, ... }:
{

  imports = [
    ./variables.nix

    # Programs
    ../../home/programs/kitty
    # ../../home/programs/nvim
    ../../home/programs/shell
    ../../home/programs/fetch
    ../../home/programs/git
    # ../../home/programs/nextcloud
    ../../home/programs/thunar
    ../../home/programs/lazygit
    ../../home/programs/zen
    ../../home/programs/micro
    ../../home/programs/vscodium
    # ../../home/programs/duckduckgo-colorscheme

    # Scripts
    ../../home/scripts # All scripts

    # System (Desktop environment like stuff)
    ../../home/system/hyprland
    ../../home/system/hypridle
    ../../home/system/hyprlock
    ../../home/system/hyprpanel
    ../../home/system/hyprpaper
    ../../home/system/wofi
    # ../../home/system/batsignal
    ../../home/system/zathura
    ../../home/system/mime
    ../../home/system/udiskie
    ../../home/system/clipman
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    packages =
      (with pkgs; [
        # Apps
        # discord # Chat
        # bitwarden # Password manager
        vlc # Video player
        # blanket # White-noise app
        # obsidian # Note taking app
        # planify
        gnome-calendar
        textpieces
        curtail

        # Dev
        go
        nodejs_latest
        python3
        jq
        # figlet
        just

        # Utils
        zip
        unzip
        optipng
        pfetch
        pandoc
        btop

        # Just cool
        peaclock
        cbonsai
        pipes
        cmatrix

        # Backup
        firefox
        # ungoogled-chromium
        # vscode

        # Temp
        mpv
        pnpm
        # realvnc-vnc-viewer

        git-crypt
        glow
        gnumake
        gptfdisk
        nil
        nixfmt-rfc-style
        pure-prompt
        rclone
        nix-prefetch-git
        nix-prefetch-github
      ])
      ++ (with pkgs.nix-shell-scripts; [
        a2dl
        alphabetize
        cfg
        clone
        colortable
        commit
        cop
        diskusage
        del
        mi
        nish
        nix-clean
        nix-switch
        nixhash
        nixos-deploy
        readme
        rm-result
        swatch
      ]);

    file = {
      ".face.icon" = {
        source = ./profile_picture.jpg;
      };

      ".hushlogin".text = "";

      "rclone.conf" = {
        source = ../../.secrets/rclone.conf;
        target = "${config.xdg.configHome}/rclone/rclone.conf";
      };
    };

    # Don't touch this
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
