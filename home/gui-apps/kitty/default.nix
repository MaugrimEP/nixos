{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    extraConfig = builtins.concatStringsSep "\n" [
      (builtins.readFile ./kitty.conf)
      (builtins.readFile ./font.conf)
    ];
  };

  xdg.configFile."kitty/launch.conf".source = ./launch.conf;

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    noto-fonts-color-emoji
    dejavu_fonts
  ];

  home.sessionVariables.TERMINAL = "kitty";
  systemd.user.sessionVariables.TERMINAL = "kitty";
}
