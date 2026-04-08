{ config, ... }: {
  home.username = "tmayet";
  home.homeDirectory = "/home/tmayet";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  xdg.configFile."gtk-3.0/bookmarks".text = ''
    file://${config.home.homeDirectory}/gdrive gdrive
    file://${config.home.homeDirectory}/PycharmProjects PycharmProjects
  '';

  imports = [
    ./cli-apps
    ./gui-apps
    ./shells
    ./services
  ];
}
