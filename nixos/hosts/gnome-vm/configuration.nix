{ 
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/nixos/docker.nix
      ../../modules/nixos/pkgs.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      ssr = import ../../home-manager/home-vm.nix;
    };
  };

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {     
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  # Bootloader configuration
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Hostname and networking configurations
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Timezone and locale settings
  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";

  # X11 and desktop environment configurations
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Sound with PipeWire
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Printing support
  services.printing.enable = true;

  # PACKAGES
  programs.zsh.enable = true;

  # DEFAULT APPS
  users.defaultUserShell = pkgs.zsh;

  # User account configuration
  users.users.ssr = {
    isNormalUser = true;
    description = "ssr";
    extraGroups = [ "wheel" "networkmanager" "audio" "docker" ];
    # Remove 'packages' here, as we'll manage user packages with Home Manager
    # packages = with pkgs; [ ];
  };

  # Enable automatic login for the user
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "ssr";

  # Workaround for GNOME autologin
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Enable Firefox
  programs.firefox.enable = true;

  # Enable Nix Flakes support
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # System packages (if any)
  environment.systemPackages = with pkgs; [
    # Add system-wide packages here if needed
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken.
  system.stateVersion = "24.05"; # Did you read the comment?
}
