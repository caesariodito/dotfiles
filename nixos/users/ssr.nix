# modules/user-ssr.nix
{ config, pkgs, ... }: {
  users.users.ssr = {
    isNormalUser = true;
    description = "ssr";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  users.extraGroups.docker.members = [ "ssr" ];
}
