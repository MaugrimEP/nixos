{ self, ... }: {
  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
    "org/gnome/shell/keybindings" = {
      show-screenshot-ui = [ "Print" "<Super><Shift>s" ];
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Emoji Picker";
      command = "smile";
      binding = "<Super>period";
    };
    "org/gnome/desktop/background" = {
      picture-uri = "file://${self}/modules/desktops/wallpapers/wallhaven-ex136k.jpg";
      picture-uri-dark = "file://${self}/modules/desktops/wallpapers/wallhaven-ex136k.jpg";
    };
  };
}
