{
  pkgs,
  ...
}:

{
  imports = [
    ./browser/brave.nix
    ./evolution
    ./fonts
    ./kitty
    ./qbittorrent
    ./suite-gnome
    # ./sqlite
  ];

  home.packages= with pkgs; [
    # Graphics editors
    gimp
    inkscape

    # Clipboard
    wl-clipboard     # Wayland
    xclip            # X11

    # Video player
    vlc

    # Office suite
    onlyoffice-desktopeditors

    gnome-boxes                    # virtual machines
    obs-studio
    picard                         # music metadata editor
  ];

  gtk.enable = true;
  qt.enable = true;
  xdg.mimeApps.enable = true;
}
