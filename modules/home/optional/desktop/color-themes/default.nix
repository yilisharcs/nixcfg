{
  pkgs,
  ...
}:

{
  gtk = {
    theme = {
      package = pkgs.kdePackages.breeze-gtk;
      name = "Breeze-Dark";
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  };
  qt.platformTheme.name = "gtk";

  # NOTE: The variable below is set because virt-manager
  # does not respect `gtk-application-prefer-dark-theme`
  home.sessionVariables = {
    GTK_THEME = "Breeze-Dark";
  };

  # NOTE: May require `xdg.portal` to sync with popups.
  # This has only been tested with COSMIC DE.
  # https://docs.windswept.digital/nixos/gtk-and-qt
}
