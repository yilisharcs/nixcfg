{
  # TODO: THIS IS INCOMPLETE

  # NOTE: home.pointerCursor has a hyprcursor option

  environment.sessionVariables = {
    GSK_RENDERER = "opengl"; # GTK apps on Wayland break without this
    NIXOS_OZONE_WL = "1";    # Support for Chromium/Electron apps without XWayland
  };

}
