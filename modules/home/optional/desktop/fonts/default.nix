{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    cantarell-fonts
    nerd-fonts.jetbrains-mono
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
    size = 12;
  };
}
