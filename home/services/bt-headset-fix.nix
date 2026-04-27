{ pkgs, lib, ... }:
let
  btFixScript = pkgs.writeShellScript "bt-headset-fix" ''
    # Fix Bluetooth A2DP audio for Turtle Beach 700 Gen 2 MAX
    #
    # This headset's A2DP profile activates on connect but the audio transport
    # fails silently. Toggling profile (A2DP -> HSP -> A2DP) forces a fresh
    # transport setup that works.

    BT_DEV_PATH="/org/bluez/hci0/dev_00_04_32_8C_08_83"
    PW_CARD="bluez_card.00_04_32_8C_08_83"

    # Profile indices from pw-cli enum-params <id> EnumProfile
    PROFILE_A2DP=131073       # a2dp-sink (SBC)
    PROFILE_HSP=196865        # headset-head-unit (MSBC)

    log() { echo "[$(date +%T)] $*"; }

    find_device_id() {
      pw-cli ls Device 2>/dev/null | \
        awk -v card="$PW_CARD" '
          /id [0-9]+,/ { id = $2; gsub(/,/, "", id) }
          index($0, "\"" card "\"") > 0 { print id }
        '
    }

    toggle_profile() {
      log "Headset connected, waiting for PipeWire device..."

      local dev_id=""
      for _ in $(seq 1 20); do
        dev_id=$(find_device_id) || true
        [ -n "$dev_id" ] && break
        sleep 0.5
      done

      if [ -z "$dev_id" ]; then
        log "PipeWire device not found after 10s"
        return 0
      fi

      # Let the A2DP transport setup attempt play out
      sleep 2

      log "Toggling profile on device $dev_id (A2DP -> HSP -> A2DP)..."
      pw-cli set-param "$dev_id" Profile "{ index: $PROFILE_HSP }" 2>/dev/null || true
      sleep 1
      pw-cli set-param "$dev_id" Profile "{ index: $PROFILE_A2DP }" 2>/dev/null || true
      log "Profile toggle complete"
    }

    log "Monitoring D-Bus for headset connection events..."

    dbus-monitor --system \
      "type='signal',sender='org.bluez',interface='org.freedesktop.DBus.Properties',member='PropertiesChanged',path=$BT_DEV_PATH" 2>/dev/null |
    while IFS= read -r line; do
      if [[ "$line" == *'"Connected"'* ]]; then
        for _ in 1 2 3; do
          IFS= read -r next_line || break
          if [[ "$next_line" == *"boolean true"* ]]; then
            toggle_profile &
            break
          elif [[ "$next_line" == *"boolean false"* ]]; then
            break
          fi
        done
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
      Environment = "PATH=${lib.makeBinPath (with pkgs; [ pipewire dbus coreutils gawk ])}";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
