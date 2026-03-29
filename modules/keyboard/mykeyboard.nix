{ self, inputs, ... }: {
  flake.nixosModules.mykeyboard = { config, lib, pkgs, modulesPath, ... }:{

  services.xserver.xkb = {
    layout = "custom-fr";

    extraLayouts.custom-fr = {
      description = "US + French accents (AltGr)";
      languages = [ "eng" "fra" ];

      symbolsFile = builtins.toFile "custom-fr" ''
        xkb_symbols "basic" {
          include "pc"
          include "us"
          include "inet(evdev)"

          name[Group1] = "US + French accents (AltGr)";

          // accents
          key <AD02> { [ w, W, egrave, Egrave ] };         // è
          key <AD03> { [ e, E, eacute, Eacute ] };         // é
          key <AD04> { [ r, R, ecircumflex, Ecircumflex ] }; // ê
          key <AD06> { [ y, Y, ugrave, Ugrave ] };         // ù

          key <AC01> { [ a, A, agrave, Agrave ] };         // à
          key <AC02> { [ s, S, scedilla, Scedilla ] };     // ç
          key <AB03> { [ c, C, ccedilla, Ccedilla ] };     // ç alt

          // ligatures
          key <AD08> { [ i, I, oe, OE ] };
          key <AD09> { [ o, O, oslash, Ooblique ] };

          include "level3(ralt_switch)"
        };
      '';
    };
  };
  };
}
