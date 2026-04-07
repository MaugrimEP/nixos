{ ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "builtin";
        source = "nixos";
        padding = {
          top = 2;
          left = 2;
          right = 4;
        };
      };

      display = {
        bar = {
          char.total = "─";
          width = 10;
        };
        percent = {
          type = 3;
          ndigits = 2;
        };
        separator = "";
      };

      modules = [
        "break"
        {
          type = "title";
          key = "  ";
          keyWidth = 4;
          keyColor = "cyan";
          format = "{#36}{1}@{2}";
        }
        {
          type = "datetime";
          key = " ";
          format = " {#white}󰃮 {1}-{4}-{10} {14}:{18}:{20} ({22})";
        }
        "break"

        # ── System (green) ──
        {
          type = "custom";
          key = "╭─System───────────";
          keyColor = "green";
        }
        {
          type = "host";
          key = "├╴ PC       ";
          keyColor = "green";
        }
        {
          type = "os";
          key = "├╴ OS       ";
          keyColor = "green";
        }
        {
          type = "kernel";
          key = "├╴ Kernel   ";
          keyColor = "green";
        }
        {
          type = "de";
          key = "├╴ DE       ";
          keyColor = "green";
        }
        {
          type = "wm";
          key = "├╴ WM       ";
          keyColor = "green";
        }
        {
          type = "packages";
          key = "├╴󰏖 Packages ";
          keyColor = "green";
        }
        {
          type = "uptime";
          key = "├╴󰥔 Uptime   ";
          keyColor = "green";
        }
        {
          type = "locale";
          key = "├╴ Locale   ";
          keyColor = "green";
        }
        {
          type = "custom";
          key = "╰───────────────────";
          keyColor = "green";
        }

        # ── Appearance (magenta) ──
        {
          type = "custom";
          key = "╭─Appearance───────";
          keyColor = "magenta";
        }
        {
          type = "wmtheme";
          key = "├╴ WM Theme ";
          keyColor = "magenta";
        }
        {
          type = "theme";
          key = "├╴ Theme    ";
          keyColor = "magenta";
        }
        {
          type = "icons";
          key = "├╴ Icons    ";
          keyColor = "magenta";
        }
        {
          type = "font";
          key = "├╴ Font     ";
          keyColor = "magenta";
        }
        {
          type = "cursor";
          key = "├╴ Cursor   ";
          keyColor = "magenta";
        }
        {
          type = "custom";
          key = "╰───────────────────";
          keyColor = "magenta";
        }

        # ── Terminal (yellow) ──
        {
          type = "custom";
          key = "╭─Terminal─────────";
          keyColor = "yellow";
        }
        {
          type = "shell";
          key = "├╴ Shell    ";
          keyColor = "yellow";
        }
        {
          type = "terminal";
          key = "├╴ Terminal ";
          keyColor = "yellow";
        }
        {
          type = "terminalfont";
          key = "├╴ Font     ";
          keyColor = "yellow";
        }
        {
          type = "terminalsize";
          key = "├╴󰘖 Size     ";
          keyColor = "yellow";
          format = "{1} columns × {2} rows ({3}px × {4}px)";
        }
        {
          type = "custom";
          key = "╰───────────────────";
          keyColor = "yellow";
        }

        # ── Hardware (red) ──
        {
          type = "custom";
          key = "╭─Hardware─────────";
          keyColor = "red";
        }
        {
          type = "display";
          key = "├╴󰍹 Display  ";
          keyColor = "red";
          format = "{1}×{2}, {3}Hz [{7}]";
        }
        {
          type = "cpu";
          key = "├╴ CPU      ";
          keyColor = "red";
          format = "{1} [{3} cores]";
        }
        {
          type = "gpu";
          key = "├╴󰢮 GPU      ";
          keyColor = "red";
        }
        {
          type = "memory";
          key = "├╴ RAM      ";
          keyColor = "red";
        }
        {
          type = "swap";
          key = "├╴󰯍 Swap     ";
          keyColor = "red";
        }
        {
          type = "disk";
          key = "├╴ Disk     ";
          keyColor = "red";
          format = "{13} {1} / {2} ({3})";
        }
        {
          type = "localip";
          key = "├╴󰛳 Local IP ";
          keyColor = "red";
        }
        {
          type = "battery";
          key = "├╴ Battery  ";
          keyColor = "red";
          format = "{10} {4} ({5})";
        }
        {
          type = "poweradapter";
          key = "├╴ Power    ";
          keyColor = "red";
        }
        {
          type = "custom";
          key = "╰───────────────────";
          keyColor = "red";
        }

        "break"
        "colors"
      ];
    };
  };
}
