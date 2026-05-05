{ pkgs, ... }:
{
  imports = [
    ./caelestia.nix
    ./defaults/gnome.nix
    ./defaults/hyprland.nix
    ./defaults/kde.nix
    ./defaults/niri.nix
    ./eww.nix
    ./games
    ./gnome.nix
    ./hyprland
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
    kdePackages.kolourpaint
    krita
    libreoffice
    obsidian
    pavucontrol
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
