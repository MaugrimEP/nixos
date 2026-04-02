{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ascii-image-converter
    bat
    claude-code
    fzf
    ghostscript
    inotify-tools
    just
    rclone
    ripgrep
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
    ./ghostscript.nix
    ./git.nix
    ./neovim.nix
  ];
}
