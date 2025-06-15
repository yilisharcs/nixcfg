{
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    pkgs.evince
  ];

  xdg.mime.defaultApplications = {
    "application/pdf" = "org.gnome.Evince.desktop";
  };
}
