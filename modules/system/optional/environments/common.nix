{
  environment.variables = {
    GSK_RENDERER = "opengl"; # NOTE: GTK apps on Wayland break without this
    NIXOS_OZONE_WL = "1";    # Support for Chromium/Electron apps
  };

  services.displayManager.cosmic-greeter.enable = true;
}
