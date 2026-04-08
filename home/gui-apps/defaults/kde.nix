{ ... }:
{
  # Loaded when XDG_CURRENT_DESKTOP=KDE
  xdg.configFile."KDE-mimeapps.list".text = ''
    [Default Applications]
    x-scheme-handler/http=google-chrome.desktop
    x-scheme-handler/https=google-chrome.desktop
    text/html=google-chrome.desktop
    application/pdf=okularApplication_pdf.desktop
    image/png=org.kde.gwenview.desktop
    image/jpeg=org.kde.gwenview.desktop
    image/gif=org.kde.gwenview.desktop
    image/webp=org.kde.gwenview.desktop
    image/svg+xml=org.kde.gwenview.desktop
    video/mp4=vlc.desktop
    video/x-matroska=vlc.desktop
    video/webm=vlc.desktop
    audio/mpeg=vlc.desktop
    audio/flac=vlc.desktop
    audio/x-wav=vlc.desktop
    inode/directory=org.kde.dolphin.desktop
  '';
}
