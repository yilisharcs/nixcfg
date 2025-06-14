{

  # TODO: include useful KDE packages

    # # pkgs.sddm-astronaut

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      # theme = "sddm-astronaut-theme";
      # settings = {
      #   Theme= {
      #     CursorTheme = "Bibata-Modern-Ice";
      #     ThemeDir = "${pkgs.kdePackages.sddm}/share/sddm/themes";
      #   };
      # };
    };
  };
}
