# hosts/my-machine.nix
{ config, pkgs, ... }: {
  imports = [
    ../modules/desktop.nix
    ../modules/networking.nix
    ../modules/services.nix
    ../modules/hardware.nix
  ];

  # Host-specific settings
  networking.hostName = "nixos-ssr";

  # Set time zone
  time.timeZone = "Asia/Jakarta";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Set system state version
  system.stateVersion = "24.05";
}
