{ ... }: {
  home.username = "tmayet";
  home.homeDirectory = "/home/tmayet";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  imports = [
    ./cli-apps
    ./gui-apps
    ./shells
  ];
}
