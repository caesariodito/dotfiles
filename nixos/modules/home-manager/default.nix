{
  imports = [
    # packages without config
    ./pkgs.nix

    # packages with config
    ./git.nix
    ./zsh.nix
    ./zoxide.nix
    ./nix-direnv.nix
  ];
}