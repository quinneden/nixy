{ config, lib, ... }:
{
  imports = [ ../../themes/nixy.nix ];

  config.var = {
    hostname = "relic";
    username = "quinn";
    configDirectory = "/home/" + config.var.username + "/.dotfiles"; # The path of the nixos configuration directory

    keyboardLayout = "en";

    location = "Portland";
    timeZone = "America/Los_Angeles";
    defaultLocale = "en_US.UTF-8";
    # extraLocale = "";

    git = {
      username = "quinneden";
      email = "quinnyxboy@gmail.com";
    };

    autoUpgrade = false;
    autoGarbageCollector = true;
  };

  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
  };
}
