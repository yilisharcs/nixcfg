{
  pkgs,
  ...
}:

{
  home.packages = [
    pkgs.vim-language-server
  ];
}
