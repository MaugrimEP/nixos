{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home.sessionVariables.EDITOR = "nvim";
  systemd.user.sessionVariables.EDITOR = "nvim";

  home.shellAliases = {
    vimdiff = "nvim -d";
  };

}
