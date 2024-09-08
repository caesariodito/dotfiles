{ pkgs, ... }:

{
  # System-wide packages
  environment.systemPackages = with pkgs; [
    wget
    xdg-utils
    fzf
    firefox
    docker  
    docker-compose
    gh
    lazygit
    pass
    vlc
  ];
} 