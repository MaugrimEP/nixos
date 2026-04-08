{ ... }:
{
  # Loaded when XDG_CURRENT_DESKTOP=niri
  xdg.configFile."niri-mimeapps.list".text = ''
    [Default Applications]
    x-scheme-handler/http=google-chrome.desktop
    x-scheme-handler/https=google-chrome.desktop
    text/html=google-chrome.desktop
    application/pdf=org.gnome.Evince.desktop
    image/png=org.gnome.eog.desktop
    image/jpeg=org.gnome.eog.desktop
    image/gif=org.gnome.eog.desktop
    image/webp=org.gnome.eog.desktop
    image/svg+xml=org.gnome.eog.desktop
    video/mp4=vlc.desktop
    video/x-matroska=vlc.desktop
    video/webm=vlc.desktop
    audio/mpeg=vlc.desktop
    audio/flac=vlc.desktop
    audio/x-wav=vlc.desktop
    inode/directory=org.gnome.Nautilus.desktop
  '';
}
