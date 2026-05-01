{ pkgs, lib, ... }:
let
  btFixScript = pkgs.writeShellScript "bt-headset-fix" ''
    # Fix Bluetooth A2DP audio for Turtle Beach 700 Gen 2 MAX
    #
    # This headset's A2DP profile activates on connect but the audio transport
    # fails silently. Toggling profile (A2DP -> HSP -> A2DP) via pactl (the
    # same protocol pavucontrol uses) forces a fresh transport setup.

    BT_DEV_PATH="/org/bluez/hci0/dev_00_04_32_8C_08_83"
    BT_CARD="bluez_card.00_04_32_8C_08_83"
    TOGGLE_PID=""

    log() { echo "[$(date +%T)] $*"; }

    toggle_profile() {
      log "Headset connected, waiting for card to appear..."

      # Wait for PipeWire/PulseAudio to register the card (up to 10s)
      for _ in $(seq 1 20); do
        if pactl list cards short 2>/dev/null | grep -q "$BT_CARD"; then
          break
        fi
        sleep 0.5
      done

      if ! pactl list cards short 2>/dev/null | grep -q "$BT_CARD"; then
        log "Card $BT_CARD not found after 10s"
        return 0
      fi

      # Let the A2DP transport setup attempt play out
      sleep 2

      log "Toggling profile (A2DP -> HSP -> A2DP) via pactl..."
      pactl set-card-profile "$BT_CARD" headset-head-unit 2>/dev/null || true
      sleep 1
      pactl set-card-profile "$BT_CARD" a2dp-sink 2>/dev/null || true
      log "Profile toggle complete"
    }

    log "Monitoring D-Bus for headset connection events..."

    connected_seen=false
    dbus-monitor --system \
      "type='signal',sender='org.bluez',interface='org.freedesktop.DBus.Properties',member='PropertiesChanged',path=$BT_DEV_PATH" 2>/dev/null |
    while IFS= read -r line; do
      if [[ "$line" == *'"Connected"'* ]]; then
        connected_seen=true
      elif $connected_seen; then
        connected_seen=false
        if [[ "$line" == *"boolean true"* ]]; then
          # Kill any previous toggle still in progress
          if [ -n "$TOGGLE_PID" ] && kill -0 "$TOGGLE_PID" 2>/dev/null; then
            kill "$TOGGLE_PID" 2>/dev/null || true
            wait "$TOGGLE_PID" 2>/dev/null || true
            log "Cancelled previous toggle"
          fi
          toggle_profile &
          TOGGLE_PID=$!
        fi
      fi
    done
  '';
in {
  systemd.user.services.bt-headset-fix = {
    Unit = {
      Description = "Fix Bluetooth A2DP audio for Turtle Beach 700 Gen 2 MAX";
      After = [ "pipewire.service" "wireplumber.service" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${btFixScript}";
      Restart = "always";
      RestartSec = 5;
      Environment = "PATH=${lib.makeBinPath (with pkgs; [ pulseaudio dbus coreutils gnugrep ])}";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
