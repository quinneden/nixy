{ config, ... }:
{
  imports = [ ../../nixos/variables-config.nix ];

  config.var = {
    hostname = "nixos-macmini";
    username = "quinn";
    configDirectory = "/home/" + config.var.username + "/.dotfiles";

    keyboardLayout = "us";

    location = "Portland";
    timeZone = "America/Los_Angeles";
    defaultLocale = "en_US.UTF-8";

    git = {
      username = "quinneden";
      email = "quinnyxboy@gmail.com";
    };

    autoUpgrade = false;
    autoGarbageCollector = true;

    theme = import ../../themes/var/2025.nix;
  };
}
