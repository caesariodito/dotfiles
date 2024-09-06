{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "NixOS - CD";
    userEmail = "caesariodito@gmail.com";
    # TODO
    # init = {
    #   defaultBranch = "main";
    # };
  };
}