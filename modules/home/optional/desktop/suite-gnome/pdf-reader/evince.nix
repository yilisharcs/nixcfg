{
  pkgs,
  ...
}:

{
  home.packages = [
    pkgs.evince
  ];

  xdg.mimeApps.defaultApplications = {
    "application/pdf" = "org.gnome.Evince.desktop";
  };

  dconf.settings = {
    "org/gnome/evince/default" = {
      inverted-colors = true;
      show-sidebar = false;
      sizing-mode = "fit-width";
    };
  };
}
