{
  pkgs,
  ...
}:

{
  imports = [
    ./browser/brave.nix
    ./cursors
    ./evolution
    ./fonts
    ./kitty
    # ./suite-gnome
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
  ];

  gtk.enable = true;
  qt.enable = true;
  xdg.mimeApps.enable = true;
}
