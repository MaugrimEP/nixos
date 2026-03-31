{ ... }:
{
  programs.caelestia = {
    enable = true;
    systemd = {
      enable = false; # started from compositor
      target = "graphical-session.target";
      environment = [];
    };
    settings = {
      bar.status = {
        showBattery = false;
      };
      paths.wallpaperDir = "~/Images";
    };
    cli = {
      enable = true;
      settings = {
        theme.enableGtk = false;
      };
    };
  };
}
