{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ascii-image-converter
    bat
    claude-code
    fzf
    inotify-tools
    just
    ripgrep
    tectonic
    television
    tree
    typst
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
