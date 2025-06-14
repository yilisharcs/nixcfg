{
  config,
  pkgs,
}:

{
  # FIXME@GNOME-shell-ext: this shouldn't be here(?)
  programs = {
    gnome-shell = {
      enable = true;
      extensions = with pkgs.gnomeExtensions; [
        { package = appindicator; }
        { package = clipboard-indicator; }
        { package = dash-to-dock; }
        { package = just-perfection; }
        { package = vitals; }
      ];
    };
  };

  dconf.settings = {
    "org/gnome/shell/extensions/appindicator" = {
      icon-size = 20;
    };
    "org/gnome/shell/extensions/clipboard-indicator" = {
      clear-on-boot = false;
      disable-down-arrow = true;
      display-mode = 2;
      keep-selected-on-clear = true;
      move-item-first = true;
      notify-on-copy = false;
      notify-on-cycle = false;
      private-mode-binding = ["<Control>F8"];
      topbar-preview-size = 11;
    };
    "org/gnome/shell/extensions/dash-to-dock" = {
      background-opacity = 0.80000000000000004;
      dash-max-icon-size = 48;
      dock-position = "BOTTOM";
      height-fraction = 0.90000000000000002;
      intellihide-mode = "ALL_WINDOWS";
      multi-monitor = true;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "LVDS-1";
    };
    "org/gnome/shell/extensions/just-perfection" = {
      accent-color-icon = true;
      max-displayed-search-results = 0;
      power-icon = false;
    };
    "org/gnome/shell/extensions/vitals" = {
      hide-zeros = false;
      hot-sensors = [
        "_memory_usage_"
        "_system_load_1m_"
        "__network-rx_max__"
        "_storage_free_"
      ];
      icon-style = 1;
      menu-centered = true;
      position-in-panel = 0;
      show-battery = false;
      show-fan = false;
      use-higher-precision = false;
    };
  };
}
