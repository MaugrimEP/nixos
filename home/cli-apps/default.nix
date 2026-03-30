{ pkgs, ... }: {
  home.packages = with pkgs; [
    ascii-image-converter
    bat
    claude-code
    inotify-tools
    just
    tectonic
    television
    tree
    typst
    vim
    wget
    yazi
  ];

  imports = [
    ./git.nix
    ./neovim.nix
  ];
}
