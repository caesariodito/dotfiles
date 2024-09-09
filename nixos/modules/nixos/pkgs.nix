{ pkgs, ... }:

{
  # System-wide packages
  environment.systemPackages = with pkgs; [
    wget
    xdg-utils
    fzf
    firefox
    google-chrome
    chromium
    docker  
    docker-compose
    gh
    lazygit
    pass
    vlc
    nixVersions.latest
  ];
} 