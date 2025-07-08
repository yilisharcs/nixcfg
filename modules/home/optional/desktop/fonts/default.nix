{
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    cantarell-fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    noto-fonts-emoji
  ];

  fonts.fontconfig = {
    enable = true;
    # TODO: figure out how to render emoji in brave tabs/cards
    defaultFonts = {
      sansSerif = ["Cantarell"];
    };
  };

  gtk.font = {
    package = pkgs.cantarell-fonts;
    name = "Cantarell";
    size = lib.mkDefault 11;
  };

  dconf.settings = {
    "org/gnome/Console" = {
      custom-font = "JetBrainsMono Nerd Font 10";
    };
    "org/gnome/desktop/interface" = {
      document-font-name = "Cantarell 11";
      font-name = "Cantarell 11";
    };
  };
}
