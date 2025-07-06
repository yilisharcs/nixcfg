{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.shellAliases = {
    icat = "kitty icat";
  };

  home.activation = {
    # Necessary until there's a way to change the default terminal.
    kittyDefaultTerm = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run ln -sf "/etc/profiles/per-user/yilisharcs/bin/kitty" "${config.home.homeDirectory}/.local/bin/cosmic-term"
      run ln -sf "/etc/profiles/per-user/yilisharcs/bin/kitty" "${config.home.homeDirectory}/.local/bin/kgx"
    '';
  };

  home.file.".config/kitty/current-theme.conf".source = ./theme.conf;

  programs.kitty = {
    enable = true;
    shellIntegration.mode = "no-rc no-cursor no-title";
    keybindings = {
      "f11" = "toggle_maximized";
      "ctrl+equal"   = "change_font_size all +2.0";
      "ctrl+minus"   = "change_font_size all -2.0";
      "ctrl+0"       = "change_font_size all 0";
      "ctrl+shift+v" = "paste_from_clipboard";
    };
    settings = {
      clear_all_shortcuts = "yes";
      cursor_shape = "block";
      copy_on_select = "no";
      shell = "${pkgs.nushell}/bin/nu";
    };
    extraConfig = ''
      include current-theme.conf
      font_size 13.0
      font_family      family='JetBrainsMonoNL Nerd Font'
      bold_font        family='JetBrainsMonoNL Nerd Font' style='Bold'
      bold_italic_font family='JetBrainsMonoNL Nerd Font' style='Bold Italic'
      modify_font cell_height 105%
    '';
  };

  # NOTE: COSMIC is at the moment unable to launch terminal programs that provide
  # .desktop files. Necessary until there's a way to change the default terminal.
  xdg.desktopEntries = {
    nvim = {
      type = "Application";
      name = "Neovim";
      genericName = "Text Editor";
      comment = "Edit text files";
      icon = "nvim";
      exec = ''kitty nvim %F'';
      terminal = false;
      startupNotify = false;
      mimeType = [
        "text/english"
        "text/plain"
        "text/x-makefile"
        "text/x-c++hdr"
        "text/x-c++src"
        "text/x-chdr"
        "text/x-csrc"
        "text/x-java"
        "text/x-moc"
        "text/x-pascal"
        "text/x-tcl"
        "text/x-tex"
        "application/x-shellscript"
        "text/x-c"
        "text/x-c++"
      ];
      categories = ["Utility" "TextEditor"];
      settings = {
        TryExec = "nvim";
        Keywords = "Text;editor;";
      };
    };
    # NOTE: programs.kitty.shellIntegration.mode = "no-title" doesn't seem to
    # be working. Therefore, create a new desktop file instead of debug it.
    kitty = {
      type = "Application";
      name = "Kitty";
      genericName = "Terminal emulator";
      comment = "Fast, feature-rich, GPU based terminal";
      icon = "kitty";
      exec = ''kitty --title Kitty'';
      startupNotify = true;
      categories = ["System" "TerminalEmulator"];
      settings = {
        Version = "1.0";
        TryExec = "kitty";
        X-TerminalArgExec = "--";
        X-TerminalArgTitle = "--title";
        X-TerminalArgAppId = "--class";
        X-TerminalArgDir = "--working-directory";
        X-TerminalArgHold = "--hold";
      };
    };
  };

  xdg.mimeApps.defaultApplications = {
    "application/x-terminal-emulator" = "kitty.desktop";
    "x-scheme-handler/terminal" = "kitty.desktop";
  };
}
