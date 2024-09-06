# flake.nix
{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      ssrlaptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";  # or "aarch64-linux" for ARM
        modules = [
          ./nixos/default.nix
        ];
      };
    };
  };
}
