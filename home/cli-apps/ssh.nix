{ ... }:
{
  # DE-agnostic SSH agent (systemd user service).
  # Replaces GNOME Keyring's gcr-ssh-agent which doesn't work on non-GNOME DEs.
  services.ssh-agent.enable = true;

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
