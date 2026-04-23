{ self, inputs, ... }:
{
  flake.nixosModules.niriDesktop =
    { pkgs, ... }:
    let
      lockscreenSrc = "${inputs.qylock}/quickshell-lockscreen";
      themesSrc = "${inputs.qylock}/themes";

      qylockLock = pkgs.writeShellScriptBin "qylock-lock" ''
        export QML2_IMPORT_PATH="${lockscreenSrc}/imports''${QML2_IMPORT_PATH:+:$QML2_IMPORT_PATH}"
        export QML_XHR_ALLOW_FILE_READ=1
        export XDG_SESSION_TYPE=wayland

        if [ -n "$1" ]; then
          export QS_THEME="$1"
        else
          themes=("${themesSrc}"/*)
          export QS_THEME=$(basename "''${themes[RANDOM % ''${#themes[@]}]}")
        fi

        export QS_THEME_PATH="${themesSrc}/$QS_THEME"
        exec ${pkgs.quickshell}/bin/quickshell -p "${lockscreenSrc}/lock_shell.qml"
      '';
    in
    {
      programs.niri.enable = true;

      # xdg-desktop-portal is required for screen sharing on Wayland
      # (Discord, Zoom, etc. use it to broker PipeWire screen capture sessions).
      xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
        config.niri.default = [ "gnome" "gtk" ];
      };

      environment.systemPackages = with pkgs; [
        grim slurp wl-clipboard tesseract imagemagick zbar curl
        gst_all_1.gst-plugins-bad
        gst_all_1.gst-plugins-base
        gst_all_1.gst-plugins-good
        gst_all_1.gst-plugins-ugly
        qt6.qt5compat
        qt6.qtmultimedia
        translate-shell wl-screenrec ffmpeg gifski
      ];

      home-manager.users.tmayet = {
        xdg.configFile."niri/config.kdl".source = ./config.kdl;
        home.packages = [
          self.packages.${pkgs.stdenv.hostPlatform.system}.myNoctalia
          qylockLock
        ];
      };
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.myNoctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
        inherit pkgs;
        settings = builtins.fromJSON (builtins.readFile ../noctalia/settings.json);
      };
    };
}
