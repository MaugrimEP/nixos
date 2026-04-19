{ config, pkgs, inputs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    initLua = builtins.readFile "${inputs.nvim-conf}/init.lua";
  };

  xdg.configFile."nvim/lua".source = "${inputs.nvim-conf}/lua";

  home.sessionVariables.EDITOR = "nvim";
  systemd.user.sessionVariables.EDITOR = "nvim";

  home.shellAliases = {
    vimdiff = "nvim -d";
  };

}
