{
  pkgs,
  ...
}:

{
  imports = [
    ./pdf-reader/evince.nix
    ./image-viewer/loupe.nix
  ];

  environment.systemPackages = with pkgs; [
    dconf-editor
    gparted                  # Partition manager
    gnome-calculator
    gnome-disk-utility
    gnome-system-monitor
    # seahorse
    # gnome-keyring
  ];

  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
  ];

  # # TODO: turn this into its own module
  # # FIXME: this doesn't enable the GNOME ssh agent!!
  # services.gnome.gnome-keyring.enable = true;
  # security.pam.services.login.enableGnomeKeyring = true;
  # services.dbus.packages = [
  #   pkgs.gnome-keyring
  #   pkgs.gcr
  # ];
  # services.xserver.displayManager.sessionCommands = ''
  #   export SSH_AUTH_SOCK
  # '';
}
