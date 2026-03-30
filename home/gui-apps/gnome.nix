{ self, ... }: {
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "file://${self}/modules/desktops/wallpapers/wallhaven-ex136k.jpg";
      picture-uri-dark = "file://${self}/modules/desktops/wallpapers/wallhaven-ex136k.jpg";
    };
  };
}
