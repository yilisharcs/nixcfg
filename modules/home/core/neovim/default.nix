{
  pkgs,
  ...
}:

{
  programs = {
    neovim = {
      enable = true;
      vimdiffAlias = true;
      extraPackages = with pkgs; [
        gcc           # Needed to compile treesitter parsers
        jq            # CLI json processor
        pandoc        # Markup converter #NOTE: for my plugin "wikibrowser.nvim"
      ];
    };
  };
}
