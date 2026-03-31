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

  imports = [
    ./git.nix
    ./neovim.nix
  ];
}
