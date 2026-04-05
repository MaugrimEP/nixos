{ self, inputs, ... }: {
  flake.nixosModules.mykeyboard = { config, lib, pkgs, ... }: {
    services.xserver.xkb = {
      layout = "custom-fr";

      extraLayouts.custom-fr = {
        description = "US + French accents (AltGr)";
        languages = [ "eng" "fra" ];

        symbolsFile = builtins.toFile "custom-fr" ''
          // Key format: key <XX> { [ Level1, Level2, Level3, Level4 ] };
          //   Level1 = bare key
          //   Level2 = Shift
          //   Level3 = AltGr (Right Alt)
          //   Level4 = Shift + AltGr

          xkb_symbols "basic" {
            include "pc"
            include "us"
            include "inet(evdev)"

            name[Group1] = "US International AltGr No Dead Keys";

            // number row
            key <AE01> { [ 1, exclam,      exclamdown,           onesuperior           ] }; // 1 ! ¡ ¹
            key <AE02> { [ 2, at,           twosuperior                                 ] }; // 2 @ ²
            key <AE03> { [ 3, numbersign,   threesuperior                               ] }; // 3 # ³
            key <AE04> { [ 4, dollar,       currency,             sterling              ] }; // 4 $ ¤ £
            key <AE05> { [ 5, percent,      EuroSign                                    ] }; // 5 % €
            key <AE06> { [ 6, asciicircum,  onequarter                                  ] }; // 6 ^ ¼
            key <AE07> { [ 7, ampersand,    onehalf                                     ] }; // 7 & ½
            key <AE08> { [ 8, asterisk,     threequarters                               ] }; // 8 * ¾
            key <AE09> { [ 9, parenleft,    leftsinglequotemark                         ] }; // 9 ( '
            key <AE10> { [ 0, parenright,   rightsinglequotemark                        ] }; // 0 ) '
            key <AE11> { [ minus, underscore, yen                                       ] }; // - _ ¥
            key <AE12> { [ equal, plus,     multiply,             division              ] }; // = + × ÷

            // top row (qwerty)
            key <AD01> { [ q, Q, acircumflex,    Adiaeresis    ] }; // q Q â Ä
            key <AD02> { [ w, W, egrave,         Aring         ] }; // w W è Å
            key <AD03> { [ e, E, eacute,         Eacute        ] }; // e E é É
            key <AD04> { [ r, R, ecircumflex                   ] }; // r R ê
            key <AD05> { [ t, T, thorn,          THORN         ] }; // t T þ Þ
            key <AD06> { [ y, Y, ucircumflex,    Udiaeresis    ] }; // y Y û Ü
            key <AD07> { [ u, U, ugrave,         Uacute        ] }; // u U ù Ú
            key <AD08> { [ i, I, icircumflex,    Iacute        ] }; // i I î Í
            key <AD09> { [ o, O, ocircumflex,    Oacute        ] }; // o O ô Ó
            key <AD10> { [ p, P, odiaeresis,     Odiaeresis    ] }; // p P ö Ö
            key <AD11> { [ bracketleft,  braceleft,  guillemotleft  ] }; // [ { «
            key <AD12> { [ bracketright, braceright, guillemotright ] }; // ] } »

            // home row (asdf)
            key <AC01> { [ a, A, agrave,      Aacute     ] }; // a A à Á
            key <AC02> { [ s, S, ediaeresis,  section    ] }; // s S ë §
            key <AC03> { [ d, D, eth,         ETH        ] }; // d D ð Ð
            key <AC08> { [ k, K, idiaeresis              ] }; // k K ï
            key <AC09> { [ l, L, odiaeresis,  Oslash     ] }; // l L ö Ø
            key <AC10> { [ semicolon, colon, paragraph, degree    ] }; // ; : ¶ °
            key <AC11> { [ apostrophe, quotedbl, acute, diaeresis ] }; // ' " ´ ¨

            // bottom row (zxcv)
            key <AB01> { [ z, Z, ae,        AE         ] }; // z Z æ Æ
            key <AB03> { [ c, C, ccedilla,  cent       ] }; // c C ç ¢
            key <AB06> { [ n, N, ntilde,    Ntilde     ] }; // n N ñ Ñ
            key <AB07> { [ m, M, mu                    ] }; // m M µ
            key <AB08> { [ comma, less, ccedilla, Ccedilla ] }; // , < ç Ç
            key <AB10> { [ slash, question, questiondown   ] }; // / ? ¿

            // misc
            key <BKSL> { [ backslash, bar, notsign, brokenbar ] }; // \ | ¬ ¦

            // Caps Lock → Ctrl+Shift (same as kitty_mod, works on both keyboards)
            key <CAPS> {
              type = "ONE_LEVEL",
              symbols[Group1] = [ NoSymbol ],
              actions[Group1] = [ SetMods(modifiers=Control+Shift) ]
            };

            include "level3(ralt_switch)"
          };
        '';
      };
    };
  };
}
