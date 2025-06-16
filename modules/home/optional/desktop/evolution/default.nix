{
  pkgs,
  ...
}:

{
  home.packages = [
    pkgs.evolution
  ];

  dconf.settings = {
    "org/gnome/evolution/calendar" = {
      use-24hour-format = true;
    };
    "org/gnome/evolution/mail" = {
      composer-magic-smileys = true;
      composer-unicode-smileys = true;
      image-loading-policy = "always";
      layout = 1;
      message-list-sort-on-header-click = "always";
      show-animated-images = true;
      show-to-do-bar = false;
    };
    "org/gnome/evolution/plugin/external-editor" = {
      # command = "neovide -- -c 'set spell'";
      command = "kitty nvim -c 'set spell'";
      launch-on-key-press = true;
    };
    "org/gnome/evolution/shell" = {
      icon-only-buttons-in-header-bar = true;
      statusbar-visible = false;
      webkit-minimum-font-size = 16;
    };
  };
}
