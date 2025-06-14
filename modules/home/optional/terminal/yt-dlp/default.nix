{
  home.shellAliases = {
    yt = "yt-dlp";
  };

  programs = {
    # YouTube downloader
    yt-dlp = {
      enable = true;
      settings = {
        no-mtime = true;
        no-playlist = true;
        output = "~/Videos/YouTube/%(title)s.%(ext)s";
      };
    };
  };
}
