{ config, pkgs, inputs, ... }:
let
  pkgs-nvim = inputs.nixpkgs-nvim.legacyPackages.${pkgs.system};
in
{
  programs.neovim = {
    enable = true;
    package = pkgs-nvim.neovim-unwrapped;
    defaultEditor = true;
    initLua = builtins.readFile "${inputs.nvim-conf}/init.lua";
  };

  xdg.configFile."nvim/lua".source = "${inputs.nvim-conf}/lua";

  home.sessionVariables.EDITOR = "nvim";
  systemd.user.sessionVariables.EDITOR = "nvim";
}
