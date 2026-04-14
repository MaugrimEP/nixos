{ pkgs, ... }:
{
  imports = [
    ./caelestia.nix
    ./defaults/gnome.nix
    ./eww.nix
    ./defaults/hyprland.nix
    ./defaults/kde.nix
    ./defaults/niri.nix
    ./gnome.nix
    ./hyprland.nix
    ./kitty
    ./zotero.nix
  ];

  home.packages = with pkgs; [
    blender
    eog
    evince
    firefox
    google-chrome
    jetbrains.pycharm
    obsidian
    smile
    spotify
    thunderbird
    vesktop
    vlc
    vscode
    wdisplays
    x11_ssh_askpass
    zoom-us
    zotero
  ];
}
