{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    extraConfig = builtins.concatStringsSep "\n" [
      (builtins.readFile ./kitty.conf)
      (builtins.readFile ./font.conf)
    ];
  };

  home.sessionVariables.TERMINAL = "kitty";
  systemd.user.sessionVariables.TERMINAL = "kitty";
}
