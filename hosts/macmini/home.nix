{ pkgs, config, ... }:
{

  imports = [
    ../../home/programs/duckduckgo-colorscheme
    ../../home/programs/fetch
    ../../home/programs/git
    ../../home/programs/kitty
    ../../home/programs/lazygit
    ../../home/programs/micro
    ../../home/programs/shell
    ../../home/programs/thunar
    ../../home/programs/vscodium
    ../../home/programs/zen
    ../../home/scripts
    ../../home/system/clipman
    ../../home/system/hypridle
    ../../home/system/hyprland
    ../../home/system/hyprlock
    ../../home/system/hyprpanel
    ../../home/system/hyprpaper
    ../../home/system/mime
    ../../home/system/udiskie
    ../../home/system/wofi
    ../../home/system/zathura
    ./variables.nix
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    packages =
      (with pkgs; [
        vlc
        gnome-calendar
        textpieces
        curtail
        go
        nodejs_latest
        python3
        jq
        just
        zip
        unzip
        optipng
        pfetch
        pandoc
        btop
        peaclock
        cbonsai
        pipes
        cmatrix
        firefox
        mpv
        pnpm
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
