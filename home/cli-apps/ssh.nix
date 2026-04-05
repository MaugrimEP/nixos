{ ... }:
{
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
