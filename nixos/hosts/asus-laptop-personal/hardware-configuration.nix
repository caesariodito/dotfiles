# This is just an example, you should generate yours with nixos-generate-config and put it in here.
{ config, lib, modulesPath, ... }:
{
  boot.loader.systemd-boot.enable = true;

  # Use the more specific filesystem settings from the second file
  fileSystems."/" = { 
    device = "/dev/disk/by-uuid/57f8e2bb-8acf-4c47-9995-0f1efc15dde0";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/9790-7997";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  # Set up swap device
  swapDevices = [
    { device = "/dev/disk/by-uuid/da15b3fc-eadf-4dbd-8428-c5dd2c921f64"; }
  ];

  # System kind required for flakes
  nixpkgs.hostPlatform = "x86_64-linux";

  # Hardware-related settings
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "uas" "sd_mod" ];
  boot.kernelModules = [ "kvm-amd" ];

  # Use DHCP by default for networking
  networking.useDHCP = lib.mkDefault true;

  # Update microcode for AMD CPUs
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # Import not-detected hardware settings
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ]; 
}
