{ pkgs, ... }:
{
  imports = [
    ./caelestia.nix
    ./gnome.nix
    ./hyprland.nix
    ./kitty
    ./zotero.nix
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
