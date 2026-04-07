{ pkgs, ... }:
{
  imports = [
    ./caelestia.nix
    ./gnome.nix
    ./hyprland.nix
    ./kitty
    ./niri
    ./zotero.nix
  ];

  home.packages = with pkgs; [
    blender
    discord
    firefox
    google-chrome
    jetbrains.pycharm
    obsidian
    spotify
    thunderbird
    vscode
    smile
    zoom-us
    zotero
  ];
}
