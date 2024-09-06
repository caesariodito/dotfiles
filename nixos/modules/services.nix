# modules/services.nix
{ config, pkgs, ... }: {
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # Enable sound with Pipewire  
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable Docker
  virtualisation.docker.enable = true;

  # Install Firefox
  programs.firefox.enable = true;

  # System-wide packages
  environment.systemPackages = with pkgs; [
    wget
    git
    gh
    vesktop
    vscode
    xdg-utils
    pass
    spotify
    spicetify-cli
  ];  
}
