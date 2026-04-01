{ pkgs, ... }:
let
  # Adjust remoteVault if your Google Drive folder has a different name.
  # Run `rclone lsd gdrive:` after setup to list top-level Drive folders.
  remoteVault = "gdrive:sync";

  watchScript = pkgs.writeShellScript "rclone-gdrive-watch" ''
    LOCAL="$HOME/gdrive"
    REMOTE="${remoteVault}"
    mkdir -p "$LOCAL"

    echo "rclone-gdrive: watching $LOCAL for changes"
    while true; do
      ${pkgs.inotify-tools}/bin/inotifywait -r -q \
        -e modify -e create -e delete -e move "$LOCAL"
      # Debounce: wait for writes to settle before syncing
      sleep 5
      echo "rclone-gdrive: change detected, syncing..."
      ${pkgs.rclone}/bin/rclone bisync "$LOCAL" "$REMOTE" \
        --resilient --recover --max-lock 2m || true
    done
  '';

  syncScript = pkgs.writeShellScript "rclone-gdrive-sync" ''
    LOCAL="$HOME/gdrive"
    REMOTE="${remoteVault}"
    mkdir -p "$LOCAL"
    exec ${pkgs.rclone}/bin/rclone bisync "$LOCAL" "$REMOTE" \
      --resilient --recover --max-lock 2m
  '';
in
{
  # Long-running service: watches local vault and syncs on every edit
  systemd.user.services.rclone-gdrive-watch = {
    Unit = {
      Description = "Watch local vault and sync changes to Google Drive";
      After = [ "network-online.target" ];
      Wants = [ "network-online.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${watchScript}";
      Restart = "on-failure";
      RestartSec = "30s";
    };
    Install.WantedBy = [ "default.target" ];
  };

  # One-shot service: triggered by the timer below to catch remote changes
  systemd.user.services.rclone-gdrive-pull = {
    Unit = {
      Description = "Periodic sync from Google Drive";
      After = [ "network-online.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${syncScript}";
    };
  };

  # Timer: pull remote changes every 15 minutes
  systemd.user.timers.rclone-gdrive-pull = {
    Unit.Description = "Periodic sync from Google Drive";
    Timer = {
      OnBootSec = "5m";
      OnUnitActiveSec = "15m";
    };
    Install.WantedBy = [ "timers.target" ];
  };
}
