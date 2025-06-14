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
    fontconfig = {
      enable = true;
      useEmbeddedBitmaps = true;
      defaultFonts = {
        # sansSerif = ["Cantarell"];
      };
    };
  };
}
