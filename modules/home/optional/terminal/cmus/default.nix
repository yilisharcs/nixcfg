{
  # TODO: optionally add this if audio module is enabled
  programs.cmus = {
    enable = true;
    extraConfig = ''
      clear
      add ~/Music/
      update-cache -f
    '';
    theme = "spotify";
  };

  home.file.".local/share/icons/hicolor/128x128/apps/cmus.png" = {
    source = ./cmus.png;
  };

  xdg.desktopEntries = {
    cmus = {
      type = "Application";
      name = "Cmus";
      comment = "Play and organize your music collection";
      icon = "cmus";
      # NOTE: waiting for cosmic to fix their stuff
      exec = "kitty cmus";
      terminal = false;
      # exec = "cmus";
      # terminal = true;
      categories = ["Player" "Audio"];
      settings = {
        TryExec = "cmus";
        Keywords = "Music;Player;";
      };
    };
  };
}
