{
  lib,
  pkgs,
  ...
}:

{
  # Configure keymap in X11
  services.xserver.xkb = lib.mkDefault {
    layout = "us";
    options = "terminate:ctrl_alt_bksp,compose:menu";
  };

  # console = {
  #   font = "Lat2-Terminus16";
  # };

  environment.systemPackages = [pkgs.keyd];

  environment.variables.XCOMPOSEFILE = "${pkgs.keyd}/share/keyd/keyd.compose";

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          "main" = {
            "`" = "~";
            "102nd" = "leftshift";
            capslock = "layer(control)";
          };
          "shift:S" = {
            "`" = "`";
            leftshift = "capslock";
            rightshift = "capslock";
          };
          # Common terminal experience for GUI apps
          "control:C" = {
            "[" = "esc";
            i = "tab";
            m = "enter";
          };
          "altgr" = {
            # Doesn't require DISPLAY
            d = "|";
            f = "%";
            s = "\\";
            w = "?";

            a = "ã";
            e = "é";
            i = "í";
            o = "õ";
            u = "ú";
            "equal" = "§";
            "]" = "ª";
            "\\" = "º";
            c = "ç";
            m = "—";
            n = "ñ";
            r = "®";
            t = "™";
            "[" = "oneshot(agudo)";
            ";" = "oneshot(macron)";
            "'" = "oneshot(greve)";
          };
          agudo = {
            a = "á";
            e = "é";
            i = "í";
            o = "ó";
            u = "ú";
          };
          macron = {
            a = "ā";
            e = "ē";
            i = "ī";
            o = "ō";
            u = "ū";
          };
          greve = {
            a = "à";
            e = "è";
            i = "ì";
            o = "ò";
            u = "ù";
          };
          "altgr+shift" = {
            a = "â";
            e = "ê";
            o = "ô";
            c = "©";
          };
        };
        extraConfig = ''
          [main]
          1 = !
          2 = @
          3 = #
          4 = $
          5 = %
          6 = ^
          7 = &
          8 = *
          9 = (
          0 = )

          [shift]
          0 = 0
          1 = 1
          2 = 2
          3 = 3
          4 = 4
          5 = 5
          6 = 6
          7 = 7
          8 = 8
          9 = 9

          [meta]
          0 = M-0
          1 = M-1
          2 = M-2
          3 = M-3
          4 = M-4
          5 = M-5
          6 = M-6
          7 = M-7
          8 = M-8
          9 = M-9

          [meta+shift]
          0 = M-S-0
          1 = M-S-1
          2 = M-S-2
          3 = M-S-3
          4 = M-S-4
          5 = M-S-5
          6 = M-S-6
          7 = M-S-7
          8 = M-S-8
          9 = M-S-9

          [control]
          0 = C-0
          1 = C-1
          2 = C-2
          3 = C-3
          4 = C-4
          5 = C-5
          6 = C-6
          7 = C-7
          8 = C-8
          9 = C-9

          [control+shift]
          0 = C-S-0
          1 = C-S-1
          2 = C-S-2
          3 = C-S-3
          4 = C-S-4
          5 = C-S-5
          6 = C-S-6
          7 = C-S-7
          8 = C-S-8
          9 = C-S-9

          [altgr]
          0 = G-0
          1 = G-1
          2 = G-2
          3 = G-3
          4 = ₤
          5 = ¢
          6 = ¬
          7 = G-7
          8 = G-8
          9 = G-9

          [altgr+shift]
          0 = G-S-0
          1 = G-S-1
          2 = G-S-2
          3 = G-S-3
          4 = G-S-4
          5 = G-S-5
          6 = G-S-6
          7 = G-S-7
          8 = G-S-8
          9 = G-S-9
        '';
      };
    };
  };
}
