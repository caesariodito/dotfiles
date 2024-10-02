{
  networking.networkmanager.enable = true;

  # For sync local tracks spotify
  networking.firewall.allowedTCPPorts = [ 57621 ];

  # In order to enable discovery of Google Cast devices on spotify
  # 51820 -> wireguard
  networking.firewall.allowedUDPPorts = [ 5353 51820 ];
}