{ ... }:
{
  # Loaded when XDG_CURRENT_DESKTOP=GNOME
  xdg.configFile."GNOME-mimeapps.list".text = ''
    [Default Applications]
    x-scheme-handler/http=google-chrome.desktop
    x-scheme-handler/https=google-chrome.desktop
    text/html=google-chrome.desktop
    application/pdf=org.gnome.Evince.desktop
    image/png=org.gnome.Loupe.desktop
    image/jpeg=org.gnome.Loupe.desktop
    image/gif=org.gnome.Loupe.desktop
    image/webp=org.gnome.Loupe.desktop
    image/svg+xml=org.gnome.Loupe.desktop
    video/mp4=org.gnome.Totem.desktop
    video/x-matroska=org.gnome.Totem.desktop
    video/webm=org.gnome.Totem.desktop
    audio/mpeg=org.gnome.Rhythmbox3.desktop
    audio/flac=org.gnome.Rhythmbox3.desktop
    audio/x-wav=org.gnome.Rhythmbox3.desktop
    inode/directory=org.gnome.Nautilus.desktop
  '';
}
