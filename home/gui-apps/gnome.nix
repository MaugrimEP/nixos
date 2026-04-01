{ self, ... }: {
  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
    "org/gnome/shell/keybindings" = {
      show-screenshot-ui = [ "Print" "<Super><Shift>s" ];
    };
    "org/gnome/desktop/background" = {
      picture-uri = "file://${self}/modules/desktops/wallpapers/wallhaven-ex136k.jpg";
      picture-uri-dark = "file://${self}/modules/desktops/wallpapers/wallhaven-ex136k.jpg";
    };
  };
}
