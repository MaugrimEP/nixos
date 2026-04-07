{ pkgs, ... }: {
  # Symlink the raw config.kdl — kept as a plain file so it works on non-NixOS systems too.
  xdg.configFile."niri/config.kdl".source = ./config.kdl;
}
