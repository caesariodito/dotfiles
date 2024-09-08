# modules/networking.nix
{ config, pkgs, ... }: {
  networking.networkmanager.enable = true;

  # For sync local tracks spotify
  networking.firewall.allowedTCPPorts = [ 57621 ];

  # In order to enable discovery of Google Cast devices on spotify
  networking.firewall.allowedUDPPorts = [ 5353 ];
}