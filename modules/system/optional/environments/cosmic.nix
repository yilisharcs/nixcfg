{
  pkgs,
  ...
}:

{
  services = {
    desktopManager.cosmic.enable = true;
    displayManager.cosmic-greeter.enable = true;
  };

  environment.cosmic.excludePackages = with pkgs; [
    cosmic-term
    cosmic-player
  ];

  environment.variables = {
    GSK_RENDERER = "opengl"; # NOTE: GTK apps on Wayland break without this
    NIXOS_OZONE_WL = "1";    # Support for Chromium/Electron apps without XWayland
  };
}
