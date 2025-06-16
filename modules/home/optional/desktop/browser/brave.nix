{
  pkgs,
  ...
}:

{
  home.packages= [
    pkgs.brave
  ];

  xdg.mimeApps.defaultApplications = {
    # "application/xhtml+xml" = "brave-browser.desktop"; # NOTE: what is this for?
    "text/html" = "brave-browser.desktop";
    "x-scheme-handler/http" = "brave-browser.desktop";
    "x-scheme-handler/https" = "brave-browser.desktop";
    "x-scheme-handler/about" = "brave-browser.desktop";
    "x-scheme-handler/unknown" = "brave-browser.desktop";
  };

  # # TODO: use home variables
  # home.sessionVariables = {
  #   # TODO: test with firefox also installed
  #   DEFAULT_BROWSER = "${pkgs.brave}/bin/brave";
  # };
}
