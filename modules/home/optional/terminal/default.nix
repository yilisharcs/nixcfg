{
  pkgs,
  ...
}:

{
  imports = [
    ./bacon
    ./btop
    ./carapace
    ./cmus
    ./direnv
    ./fastfetch
    ./gdu
    ./hardware-utils
    ./jujutsu
    ./lang-tools
    ./starship
    ./taskwarrior
    ./tokei
    ./wiki-tui
    ./yt-dlp
    ./zk
  ];

  home.packages = with pkgs; [
    entr             # Event Notify Test Runner
    ffmpeg           # Universal media converter
    imagemagick      # Bitmap image tool
    porsmo           # CLI pomodoro app
    ripgrep-all      # ripgrep extension
    speedtest-rs     # Check your internet speed
    trash-cli
    w3m              # TTY browser
  ];
}
