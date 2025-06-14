{
  pkgs,
  ...
}:

{
  imports = [
    ./browser/brave.nix
    ./fonts/nerd-fonts.nix
    ./mail/evolution.nix
    ./term-emulator/kitty.nix
  ];

  environment.systemPackages = with pkgs; [
    # Graphics editors
    gimp
    inkscape

    # Partition manager
    gparted

    # Clipboard
    wl-clipboard     # Wayland
    xclip            # X11

    # Video player
    vlc

    # GNOME suite
    dconf-editor
    evince                 # PDF viewer
    gnome-calculator
    gnome-disk-utility
    gnome-system-monitor
    loupe                  # Image viewer
    seahorse
    gnome-keyring
  ];

  # xdg.mime = {
  #   enable = true;
  #   defaultApplications = {
  #     "application/pdf" = "org.gnome.Evince.desktop";
  #     # FIXME: COSMIC files doesn't play nice with Loupe for some reason;
  #     # it's opening images in the browser instead. Why???
  #     "image/jpeg" = "org.gnome.Loupe.desktop";
  #   };
  # };


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
