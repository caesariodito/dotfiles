{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "NixOS - CD";
    userEmail = "caesariodito@gmail.com";
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
    # TODO
    # init = {
    #   defaultBranch = "main";
    # };
  };
}