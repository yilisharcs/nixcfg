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
  gtk.enable = true;
}
