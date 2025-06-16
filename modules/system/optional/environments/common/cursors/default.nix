{
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    pkgs.bibata-cursors
  ];

  environment.variables = {
    XCURSOR_SIZE = 24;
    XCURSOR_THEME = "Bibata-Modern-Ice";
  };
}
