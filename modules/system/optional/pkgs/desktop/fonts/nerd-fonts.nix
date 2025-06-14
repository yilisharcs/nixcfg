{
  pkgs,
  ...
}:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      cantarell-fonts
      nerd-fonts.jetbrains-mono
      noto-fonts-emoji
    ];
    # TODO: figure out how to render emoji in brave tabs/cards
    # NOTE@FONTS Home Manager manages the fonts at ../../../../../home/optional/desktop/cursors
    # FIXME: needs a common fonts file
    fontconfig = {
      enable = true;
      useEmbeddedBitmaps = true;
      defaultFonts = {
        sansSerif = ["Cantarell"];
      };
    };
  };
}
