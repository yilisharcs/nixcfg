{
  pkgs,
  ...
}:

{
  # TODO: change in display manager also
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    # hyprcursor = { enable = true; size = 24; };
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };
  gtk = {
    enable = true;
    # NOTE@FONTS: this shouldn't be here.
    font = {
      package = pkgs.cantarell-fonts;
      name = "Cantarell";
      size = 12;
    };
    # iconTheme = {
    #   name = "breeze-dark";
    #   package = "";
    # };
    # theme = {
    #   package = pkgs.adw-gtk3;
    #   name = "Adwaita Dark";
    # };
  };
  qt = {
    enable = true;
    # platformTheme.name = "gtk";
    style.name = "breeze-dark";
    style.package = pkgs.kdePackages.breeze;
  };
}
