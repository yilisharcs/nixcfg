{
  pkgs,
  ...
}:

{
  imports = [
    ./cursors
  ];

  environment.variables = {
    GSK_RENDERER = "opengl"; # NOTE: GTK apps on Wayland break without this
    NIXOS_OZONE_WL = "1";    # Support for Chromium/Electron apps
  };

  services.displayManager.cosmic-greeter.enable = true;

  # xdg.portal = {
  #   enable = true;
  #   xdgOpenUsePortal = true;
  #   # config = {
  #   #   common = {
  #   #     default = [
  #   #       "gtk"
  #   #     ];
  #   #   };
  #   # };
  #   extraPortals = with pkgs; [
  #     xdg-desktop-portal-cosmic
  #     xdg-desktop-portal-gnome
  #     xdg-desktop-portal-gtk
  #     xdg-desktop-portal-hyprland
  #   ];
  # };
}
