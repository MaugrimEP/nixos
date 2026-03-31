{ ... }:
{
  programs.zsh.initContent = ''
    gs-compress() {
      local input="$1"
      local output="$2"
      gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default -dNOPAUSE -dQUIET -dBATCH \
        -sOutputFile="$output" "$input"
    }
  '';
}
