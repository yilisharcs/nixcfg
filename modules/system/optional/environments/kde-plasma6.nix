{
  pkgs,
  ...
}:

{
  imports = [
    ./common
  ];

  # TODO: include useful KDE packages

    # # pkgs.sddm-astronaut

environment.systemPackages = with pkgs; [
    # KDE
    kdePackages.discover # Optional: Install if you use Flatpak or fwupd firmware update sevice
    kdePackages.kcalc # Calculator
    kdePackages.kcharselect # Tool to select and copy special characters from all installed fonts
    kdePackages.kcolorchooser # A small utility to select a color
    kdePackages.kolourpaint # Easy-to-use paint program
    kdePackages.ksystemlog # KDE SystemLog Application
    kdePackages.sddm-kcm # Configuration module for SDDM
    kdiff3 # Compares and merges 2 or 3 files or directories
    hardinfo2 # System information and benchmarks for Linux systems
    haruna # Open source video player built with Qt/QML and libmpv
    xclip # Tool to access the X clipboard from a console application
  ];

  services = {
    desktopManager.plasma6.enable = true;
    # displayManager.sddm = {
    #   enable = true;
    #   wayland.enable = true;
    #   # theme = "sddm-astronaut-theme";
    #   # settings = {
    #   #   Theme= {
    #   #     CursorTheme = "Bibata-Modern-Ice";
    #   #     ThemeDir = "${pkgs.kdePackages.sddm}/share/sddm/themes";
    #   #   };
    #   # };
    # };
  };
}
