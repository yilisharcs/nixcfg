{
  pkgs,
  ...
}:

{
  # TODO: include useful GNOME packages
  environment.systemPackages = with pkgs; [
    dconf-editor
    gnome-tweaks     # Advanced GNOME settings editor
  ];

  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };

  environment.gnome.excludePackages = with pkgs; [
    epiphany         # Web browser
    geary            # Mail client
    totem
  ];

  environment.variables = {
    GSK_RENDERER = "opengl"; # NOTE: GTK apps on GNOME/Wayland break without this
    NIXOS_OZONE_WL = "1";    # Support for Chromium/Electron apps without XWayland
  };

  # Home Manager manages GNOME extensions at ../../../home/optional/desktop/gnome-shell-extensions
  # FIXME@GNOME-shell-ext: consolidate all extension configuration into this file somehow
}
