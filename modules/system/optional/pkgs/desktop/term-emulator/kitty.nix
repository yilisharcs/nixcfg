{
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    pkgs.kitty
  ];

  # NOTE: for some reason, this does nothing
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/terminal" = "kitty.desktop";
      "application/x-terminal-emulator" = "kitty.desktop";
    };
  };
}
