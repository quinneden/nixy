{
  config,
  inputs,
  pkgs,
  ...
}:
let
  inherit (config.var) autoGarbageCollector configDirectory;
in
{
  programs.nh = {
    enable = true;
    package = inputs.nh.packages.${pkgs.system}.default;
    clean = {
      enable = autoGarbageCollector;
      dates = "daily";
      extraArgs = "--keep-since 7d";
    };
  };
}
