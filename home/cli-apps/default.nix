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
