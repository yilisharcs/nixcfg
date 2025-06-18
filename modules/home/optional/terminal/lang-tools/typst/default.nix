{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    typst
    tinymist
    websocat      # typst-preview.nvim dep
  ];
}
