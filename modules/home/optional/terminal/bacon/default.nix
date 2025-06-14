{
  programs = {
    # background code checker
    bacon = {
      enable = true;
      settings = {
        summary = false;
        wrap = true;
        reverse = false;
        help_line = false;
        on_change_strategy = "kill_then_restart";
        exports.locations = {
          auto = false;
          exporter = "locations";
          path = ".bacon-locations";
          line_format = "{kind} {path}:{line}:{column} {message}";
        };
        sound.enabled = false;
        keybindings = {
          esc = "back";
          g = "scroll-to-top";
          shift-g = "scroll-to-bottom";
          j = "scroll-lines(1)";
          k = "scroll-lines(-1)";
          ctrl-d = "scroll-page(1)";
          ctrl-u = "scroll-page(-1)";
        };
      };
    };
  };
}
