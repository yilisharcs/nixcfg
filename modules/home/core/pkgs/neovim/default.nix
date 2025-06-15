{
  pkgs,
  ...
}:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraPackages = with pkgs; [
      gcc           # Needed to compile treesitter parsers
      jq            # CLI json processor
      pandoc        # Markup converter #NOTE: for my plugin "wikibrowser.nvim"
    ];
  };

  home.sessionVariables = {
    SUDO_EDITOR = "nvim";
  };

  # TODO: configure neovide here
  xdg.mimeApps.defaultApplications = {
    "application/octet-stream" = "nvim.desktop";
    "application/x-zerosize" = "nvim.desktop";
  };
}
