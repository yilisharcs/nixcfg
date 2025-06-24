{
  pkgs,
  ...
}:

{
  imports = [
    ./color-themes
    ./cursors-gtk
    ./evolution
    ./fonts
    ./kitty
    # ./neovide
    ./obs-studio
    ./qbittorrent
    ./suite-gnome
    # ./sqlite
  ];

  home.packages = with pkgs; [
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

    # Music metadata editor
    picard
  ];

  gtk.enable = true;
  qt.enable = true;
  xdg.mimeApps.enable = true;

  dconf.settings."org/virt-manager/virt-manager/connections" = {
    autoconnect = ["qemu:///system"];
    uris = ["qemu:///system"];
  };
}
