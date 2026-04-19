{ pkgs, ... }:
{

  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    PAGER = "bat";
  };

  home.packages = with pkgs; [
    ascii-image-converter
    basedpyright
    bat
    claude-code
    fastfetch
    fzf
    ghostscript
    inotify-tools
    just
    manim
    prettier
    python3Packages.debugpy
    rclone
    ripgrep
    ruff
    tectonic
    television
    tree
    typst
    unzip
    uv
    vim
    wget
    yaml-language-server
    yamllint
    yazi
    zmk-studio
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  imports = [
    ./fastfetch.nix
    ./ghostscript.nix
    ./git.nix
    ./neovim.nix
    ./ssh.nix
  ];
}
