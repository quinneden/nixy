{
  pkgs,
  config,
  inputs,
  ...
}:
let
  accent = "#${config.lib.stylix.colors.base0D}";
  background = "#${config.lib.stylix.colors.base00}";
  foreground = "#${config.lib.stylix.colors.base05}";
  muted = "#${config.lib.stylix.colors.base03}";

  settings = ''
    {
      "config": {
        "title" : "Welcome Home",
        "openLinksInNewTab": false,
        "locale": "en-US",
        "colors": {
          "primary": "${accent}",
          "background": "${background}",
          "foreground": "${foreground}",
          "muted": "#${muted}"
        },
        "folders": [
          {
            "name": "Bookmarks",
            "links": [
              {"title": "ChatGPT", "url": "https://chat.openai.com/", "icon": "󰭹"},
              {"title": "Cloudflare Dash", "url": "https://dash.cloudflare.com/", "icon": ""},
              {"title": "Github", "url": "https://github.com", "icon": ""},
              {"title": "Home-Manager Options", "url": "https://nix-community.github.io/home-manager/options.xhtml", "icon": ""},
              {"title": "NixOS Manual", "url": "https://nixos.org/manual/nixos/unstable", "icon": ""},
              {"title": "NixOS/nixpkgs", "url": "https://github.com/nixos/nixpkgs", "icon": ""},
              {"title": "NixOS Search", "url": "https://search.nixos.org", "icon": ""},
            ]
          }
        ]
      }
    }
  '';

  homepage = pkgs.buildNpmPackage {
    pname = "homepage";
    version = "0.0.0";

    src = pkgs.fetchFromGitHub {
      owner = "anotherhadi";
      repo = "homepage";
      rev = "b77d35ed3596eb451bd2ec78063d7cc6e73c773d";
      hash = "sha256-j/40922kfAh6zqJ4IRYpr66YXNNYsxuXwZ0aiJFJea0=";
    };

    # npmDepsHash = lib.fakeHash;
    npmDepsHash = "sha256-bG+CHTq2Rst3JMxsjAC81KhK+G7WwsTVD1eyP87g0z4=";

    buildPhase = ''
      npm install
      cp ${pkgs.writeText "src/routes/config.json" settings} src/routes/config.json
      npm run build
      mkdir $out
      mv build $out
    '';

    meta = {
      description = "homepage";
      homepage = "https://github.com/anotherhadi/homepage";
    };
  };
in
{
  # home.file.".config/homepage" = {
  #   source = "${homepage}/build";
  #   recursive = true;
  # };

  home.packages = with pkgs; [ inputs.zen-browser.packages."${system}".default ];
}
