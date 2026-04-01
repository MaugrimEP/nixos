{ pkgs, ... }:
{
  imports = [
    ./caelestia.nix
    ./gnome.nix
    ./kitty
  ];

  home.packages = with pkgs; [
    discord
    firefox
    google-chrome
    jetbrains.pycharm
    obsidian
    spotify
    vscode
    zoom-us
    zotero
  ];
}
