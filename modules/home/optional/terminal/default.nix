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
    ./jujutsu
    ./starship
    ./taskwarrior
    ./tokei
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
