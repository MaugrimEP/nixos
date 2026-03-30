{ pkgs, ... }: {
  imports = [
    ./gnome.nix
    ./kitty
  ];

  home.packages = with pkgs; [
    discord
    firefox
    google-chrome
    jetbrains.pycharm
    obsidian
    vscode
    zoom-us
  ];
}
