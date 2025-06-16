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
    ./gdu
    ./jujutsu
    ./taskwarrior
    ./yt-dlp
    ./zk
  ];

  home.packages = with pkgs; [
    entr             # Event Notify Test Runner
    ripgrep-all      # ripgrep extension
    trash-cli
    w3m              # TTY browser
  ];
}
