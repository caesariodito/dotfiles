# modules/networking.nix
{ config, pkgs, ... }: {
  networking.networkmanager.enable = true;
}
