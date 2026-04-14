{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 1000000;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "copyfile"
        "copypath"
        "copybuffer"
        "dirhistory"
        "history"
        "zsh-interactive-cd"
      ];
    };
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "zsh-vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];
    shellAliases = {
      cat = "bat";
    };
    initContent = ''
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      # Show background job count in prompt
      typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=true
      typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=red
      fastfetch

      # Always use block cursor
      echo -ne '\e[2 q'
      zle-line-init() { echo -ne '\e[2 q' }
      zle -N zle-line-init
    '';
  };
}
