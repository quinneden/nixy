{ pkgs, config, ... }:
let
  keyboardLayout = config.var.keyboardLayout;
in
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = keyboardLayout;
      xkb.variant = "";
    };
    gnome.gnome-keyring.enable = true;
  };
  console.keyMap = keyboardLayout;

  security.sudo.wheelNeedsPassword = false;

  environment.variables = {
    XDG_DATA_HOME = "$HOME/.local/share";
    # PASSWORD_STORE_DIR = "$HOME/.local/share/password-store";
    EDITOR = "micro";
  };

  programs.dconf.enable = true;

  services = {
    dbus.enable = true;
    gvfs.enable = true;
    libinput.enable = true;
    upower.enable = true;
    # power-profiles-daemon.enable = true;
    udisks2.enable = true;

    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };
  };

  documentation = {
    enable = true;
    doc.enable = false;
    man.enable = true;
    dev.enable = false;
    info.enable = false;
    nixos.enable = false;
  };

  environment.systemPackages = with pkgs; [
    bc
    curl
    fd
    gcc
    gh
    git-ignore
    wget
    xdg-utils
  ];

  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
}
