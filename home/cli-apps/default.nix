{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ascii-image-converter
    bat
    claude-code
    python3Packages.debugpy
    fastfetch
    fzf
    ghostscript
    inotify-tools
    just
    rclone
    basedpyright
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
    yazi
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
