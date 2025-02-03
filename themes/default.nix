{ config, lib }:
let
  cfg = config.var.theme;
in
with lib;
{
  options.var.theme = {
    enable = mkEnableOption "Enable theme config" // {
      default = true;
    };

    rounding = mkOption {
      type = types.int;
      default = null;
    };

    gapsIn = mkOption {
      type = types.int;
      default = null;
    };

    gapsOut = mkOption {
      type = types.int;
      default = cfg.gapsIn * 2;
    };

    activeOpacity = mkOption {
      type = types.numbers.between 0 1;
      default = 1;
    };

    inactiveOpacity = mkOption {
      type = types.numbers.between 0 1;
      default = null;
    };

    blur = mkOption {
      type = types.bool;
      default = null;
    };

    borderSize = mkOption {
      type = types.int;
      default = null;
    };

    animationSpeed = mkOption {
      type =
        with types;
        oneOf [
          (strMatching "fast")
          (strMatching "medium")
          (strMatching "slow")
        ];
      default = "medium";
    };

    fetch = mkOption {
      type =
        with types;
        oneOf [
          (strMatching "neofetch")
          (strMatching "nerdfetch")
          (strMatching "none")
          (strMatching "pfetch")
        ];
      default = "none";
    };

    bar = mkOption {
      type =
        with types;
        attrsOf (submodule {
          options = {
            position = mkOption { type = either (strMatching "top") (strMatching "bottom"); };
            transparent = mkOption { type = bool; };
            transparentButtons = mkOption { type = bool; };
            floating = mkOption { type = bool; };
          };
        });

      default = { };
    };
  };

  config = mkIf cfg.enable {
    var.theme = {
      inherit (cfg)
        rounding
        gapsIn
        gapsOut
        activeOpacity
        inactiveOpacity
        blur
        borderSize
        animationSpeed
        fetch
        bar
        ;
    };
  };
}

/*
  rounding = 12;
  gaps-in = 4;
  gaps-out = gaps-in * 1.5;
  active-opacity = 1;
  inactive-opacity = 0.96;
  blur = true;
  border-size = 2;
  animation-speed = "medium"; # "fast" | "medium" | "slow"
  fetch = "neofetch"; # "nerdfetch" | "neofetch" | "pfetch" | "none"

  bar = {
    position = "top";
    transparent = true;
    transparentButtons = false;
    floating = true;
  };
*/
