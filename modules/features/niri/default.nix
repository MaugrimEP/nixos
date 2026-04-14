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

        config="$HOME/.config/qylock/theme"
        if [ -n "$1" ]; then
          export QS_THEME="$1"
        elif [ -f "$config" ]; then
          export QS_THEME=$(cat "$config")
        else
          export QS_THEME="pixel-coffee"
        fi

        export QS_THEME_PATH="${themesSrc}/$QS_THEME"
        exec ${pkgs.quickshell}/bin/quickshell -p "${lockscreenSrc}/lock_shell.qml"
      '';
    in
    {
      programs.niri.enable = true;

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
        home.file.".config/qylock/theme".text = "pixel-coffee";
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
