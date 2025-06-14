{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    btop             # Resource monitor
    entr             # Event Notify Test Runner
    gdu              # Disk space analyzer
    ripgrep-all      # ripgrep extension
    trash-cli
  ];
}
