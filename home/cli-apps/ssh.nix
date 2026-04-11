{ pkgs, ... }:
{
  # DE-agnostic SSH agent (systemd user service).
  # Replaces GNOME Keyring's gcr-ssh-agent which doesn't work on non-GNOME DEs.
  services.ssh-agent.enable = true;

  systemd.user.services.ssh-agent.serviceConfig.Environment = [
    "SSH_ASKPASS=${pkgs.x11_ssh_askpass}/lib/ssh/x11-ssh-askpass"
  ];

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        addKeysToAgent = "confirm";
      };
      "austral02" = {
        hostname = "austral-transfert.criann.fr";
        user = "tmayet02";
        forwardAgent = true;
        serverAliveInterval = 60;
        serverAliveCountMax = 3;
      };
      "austral03" = {
        hostname = "austral-transfert.criann.fr";
        user = "tmayet03";
        forwardAgent = true;
        serverAliveInterval = 60;
        serverAliveCountMax = 3;
      };
    };
  };
}
