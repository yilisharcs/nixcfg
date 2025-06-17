{
  pkgs,
  ...
}:

{
  # CLI Wikipedia client
  home.packages = [
    pkgs.wiki-tui
  ];

  home.shellAliases = {
    wiki = "wiki-tui";
  };
}
