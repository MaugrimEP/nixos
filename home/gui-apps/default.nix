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
    firefox
    google-chrome
    jetbrains.pycharm
    obsidian
    smile
    spotify
    thunderbird
    vesktop
    vscode
    zoom-us
    zotero
  ];
}
