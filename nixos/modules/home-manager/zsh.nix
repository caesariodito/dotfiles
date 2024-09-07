# TODO
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];

  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "thefuck"
        "node"
      ];
    };
    # shellInit = ''
    #   # Initialize zoxide
    #   eval "$(zoxide init zsh)"

    #   # Alias 'cd' to use 'z'
    #   alias cd="z"
    # '';
  };
}