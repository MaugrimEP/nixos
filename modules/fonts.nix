{ self, inputs, ... }:

{
  flake.nixosModules.fonts = { pkgs, ... }:
    let
      fontDir = builtins.path {
        path = ./fonts;
        name = "custom-fonts-src";
      };
    in
    {
      fonts.packages = [
        (pkgs.runCommand "custom-fonts" { } ''
          mkdir -p $out/share/fonts/truetype
          cp -r ${fontDir}/* $out/share/fonts/truetype/
        '')
      ];
    };
}
