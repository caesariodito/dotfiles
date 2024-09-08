# TODO
{ pkgs, ... }:
{
  # home.packages = with pkgs; [
  #   zsh-autosuggestions
  #   zsh-syntax-highlighting
  # ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "node"
      ];
    };

    shellAliases = {
      # Aliasing nix develop to use zsh shell instead of the default bash shell
      nd="nix develop -c zsh";
    };
  };
}