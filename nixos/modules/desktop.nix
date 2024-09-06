# modules/desktop.nix
{ config, pkgs, ... }: {
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # X11 keymap configuration
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable touchpad support (optional)
  services.libinput.enable = true;
}
