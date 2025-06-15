{
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    pkgs.loupe
  ];

  # programs.dconf.profiles.user.databases = [
  #   {
  #     settings = {
  #       "org/gnome/Loupe" = {
  #         show-properties = false;
  #       };
  #     };
  #   }
  # ];

  # xdg.mime.defaultApplications = {
  #   # FIXME: COSMIC files doesn't play nice with Loupe for some reason;
  #   # it's opening images in the browser instead. Why???
  #   "image/jpeg" = "org.gnome.Loupe.desktop";
  # };
}
