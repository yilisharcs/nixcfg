{
  pkgs,
  ...
}:

{
  imports = [
    ./common
  ];

  # TODO: THIS IS INCOMPLETE

  # NOTE: home.pointerCursor has a hyprcursor option
  # DOESN'T BELONG HERE
  # home.pointerCursor = {
  #   enable = true;
  #   gtk.enable = true;
  #   # hyprcursor = { enable = true; size = 24; };
  #   package = pkgs.bibata-cursors;
  #   name = "Bibata-Modern-Ice";
  #   size = 24;
  # };
}
