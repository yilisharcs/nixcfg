{
  pkgs,
  ...
}:

{
  home.packages = [
    # Torrent client
    pkgs.qbittorrent
  ];

  home.file.".config/qBittorrent/themes" = {
    source = ./themes;
    recursive = true;
  };
}
