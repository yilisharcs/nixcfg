{
  pkgs,
  ...
}:

{
  imports = [
    ./bacon
    ./btop
    ./cmus
    ./fastfetch
    ./jujutsu
    ./taskwarrior
    ./yt-dlp
    ./zk
  ];

  home.packages = with pkgs; [
    entr             # Event Notify Test Runner
    gdu              # Disk space analyzer
    ripgrep-all      # ripgrep extension
    trash-cli
    w3m              # TTY browser
  ];
}
