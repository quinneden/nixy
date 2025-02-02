{
  # https://github.com/anotherhadi/nixy
  description = ''
    Nixy is a NixOS configuration with home-manager, secrets and custom theming all in one place.
    It's a simple way to manage your system configuration and dotfiles.
  '';

  inputs = {
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    hyprcursor-phinger.url = "github:jappie3/hyprcursor-phinger";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    hyprpolkitagent.url = "github:hyprwm/hyprpolkitagent";
    hyprspace.url = "github:KZDKM/Hyprspace";
    nh.url = "github:viperml/nh";
    nix-shell-scripts.url = "github:quinneden/nix-shell-scripts";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    stylix.url = "github:danth/stylix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-apple-silicon = {
      url = "github:tpwrules/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    let
      secrets =
        with nixpkgs.lib;
        genAttrs [
          "cachix"
          "cloudflare"
          "github"
          "pubkeys"
        ] (s: builtins.fromJSON (readFile ./.secrets/${s}.json));
    in
    {
      nixosConfigurations = {
        nixos-macmini = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          specialArgs = { inherit secrets; };
          modules = [
            {
              nixpkgs.overlays = with inputs; [
                hyprpanel.overlay
                nh.overlays.default
                nix-shell-scripts.overlays.default
                nur.overlays.default
              ];
              _module.args = { inherit inputs; };
            }
            inputs.home-manager.nixosModules.default
            inputs.lix-module.nixosModules.default
            inputs.nixos-apple-silicon.nixosModules.default
            inputs.stylix.nixosModules.default
            # ./hosts/macmini/configuration.nix
          ];
        };

      };

      formatter = nixpkgs.legacyPackages.aarch64-linux.nixfmt-rfc-style;
    };
}
