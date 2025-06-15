{
  home.shellAliases = {
    yt = "yt-dlp";
  };

  # YouTube downloader
  programs.yt-dlp = {
    enable = true;
    settings = {
      no-mtime = true;
      no-playlist = true;
      output = "~/Videos/YouTube/%(title)s.%(ext)s";
    };
  };
}
