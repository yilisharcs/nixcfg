{
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./gnome-extensions
    ./image-viewer/loupe.nix
    ./pdf-reader/evince.nix
    ./keyring
  ];

  home.packages = with pkgs; [
    dconf-editor
    gparted                  # Partition manager
    gnome-calculator
    gnome-disk-utility
    gnome-system-monitor
    gnome-tweaks             # Advanced GNOME settings editor
  ];

  dconf.settings = with lib.gvariant; {
    "org/gnome/Console" = {
      custom-font = "JetBrainsMono Nerd Font 10";
    };
    "org/gnome/GWeather4" = {
      temperature-unit = "centigrade";
    };
    "org/gnome/desktop/a11y" = {
      always-show-universal-access-status = true;
    };
    "org/gnome/desktop/a11y/interface" = {
      high-contrast = true;
      show-status-shapes = true;
    };
    "org/gnome/desktop/datetime" = {
      automatic-timezone = true;
    };
    "org/gnome/desktop/input-sources" = {
      xkb-options = ["terminate:ctrl_alt_bksp"];
    };
    "org/gnome/desktop/interface" = {
      accent-color = "green";
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/peripherals/keyboard" = {
      delay = mkUint32 200;
      repeat = true;
      repeat-interval = mkUint32 20;
    };
    "org/gnome/desktop/peripherals/keyboard" = {
      edge-scrolling-enabled = true;
      natural-scroll = false;
      two-finger-scrolling-enabled = false;
    };
    "org/gnome/desktop/sound" = {
      allow-volume-above-100-percent = true;
    };
    "org/gnome/desktop/wm/keybindings" = {
      move-to-workspace-left = ["<Shift><Super>minus"];
      move-to-workspace-right = ["<Shift><Super>equal"];
      switch-to-workspace-left = ["<Super>minus"];
      switch-to-workspace-right = ["<Super>equal"];
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,close";
      focus-mode = "sloppy";
    };
    "org/gnome/mutter" = {
      center-new-windows = true;
    };
    "org/gnome/nautilus/preferences" = {
      click-policy = "single";
      show-hidden-files = true;
    };
    "org/gnome/nautilus/compression" = {
      default-compression-format = "tar.xz";
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };
    "org/gnome/shell" = {
      favorite-apps = [
        "nvim.desktop"
        "org.gnome.Evolution.desktop"
        "brave-browser.desktop"
        "org.inkscape.Inkscape.desktop"
        "org.gnome.Calendar.desktop"
        "org.gnome.Music.desktop"
        "org.gnome.Nautilus.desktop"
      ];
      last-selected-power-profile = "performance";
    };
    # "org/gnome/shell/weather" = {
    #   automatic-location = true;
    # };
    "org/gtk/gtk4/settings/file-chooser" = {
      show-hidden = true;
    };
    "org/gtk/settings/file-chooser" = {
      show-hidden = true;
      sort-directories-first = true;
    };
  };
}
