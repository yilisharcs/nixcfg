{
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    pkgs.brave
  ];

  xdg.mime = {
    enable = true;
    defaultApplications = {
      # "application/xhtml+xml" = "brave-browser.desktop"; # NOTE: what is this for?
      "text/html" = "brave-browser.desktop";
      "x-scheme-handler/http" = "brave-browser.desktop";
      "x-scheme-handler/https" = "brave-browser.desktop";
      "x-scheme-handler/about" = "brave-browser.desktop";
      "x-scheme-handler/unknown" = "brave-browser.desktop";
    };
  };

  environment.variables = {
    # TODO: test with firefox also installed
    DEFAULT_BROWSER = "${pkgs.brave}/bin/brave";
  };
}
